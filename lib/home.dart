import 'dart:io';
import 'dart:typed_data';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:gemini/drawer.dart';
import 'package:image_picker/image_picker.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: '0', firstName: 'User');
  ChatUser geminiUser = ChatUser(id: '1', firstName: 'Hive');
  FocusNode _focusNode = FocusNode();



  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
      });
    });
    // Automatically send a welcome message when the app starts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _sendWelcomeMessage();
    });
  }

  @override
  void dispose() {
    _focusNode.dispose(); // Clean up the focus node
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HiVE CHaT',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 100),
            child: Image.asset(
              'Assets/img_1.png', // Replace with your image path
              height: 30, // Adjust height as needed
              fit: BoxFit.contain, // Ensure the image is contained
            ),
          ),
        ],
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.line_weight_rounded, color: Colors.red),
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer on icon click
            },
          ),
        ),
      ),
      drawer: CustomDrawer(
        onStartNewChat: _startNewChat,  // Pass the start new chat function
      ),
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            _buildUI(),
          ],
        ),
      ),
    );
  }

  Widget _buildUI() {
    return DashChat(
      messageOptions: MessageOptions(
        currentUserContainerColor: Colors.orange.shade700,
        containerColor: Colors.white,
      ),
      inputOptions: InputOptions(
        trailing: [
          IconButton(
            onPressed: _showImageSourceOptions, // Updated to show options
            icon: Icon(Icons.add, color: Colors.white), // Icon for options
          ),
        ],
        focusNode: _focusNode, // Add focus node to the text input
      ),
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      List<Uint8List>? images;
      if (chatMessage.medias?.isNotEmpty ?? false) {
        images = [
          File(chatMessage.medias!.first.url).readAsBytesSync(),
        ];
      }
      gemini.streamGenerateContent(question, images: images).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (lastMessage != null && lastMessage.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts
              ?.fold("", (previousValue, current) => "$previousValue ${current.text}") ??
              "";

          lastMessage.text += response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response =
              event.content?.parts?.fold("", (previousValue, current) => "$previousValue$current") ??
                  "";
          ChatMessage message = ChatMessage(
              user: geminiUser,
              createdAt: DateTime.now(),
              text: response);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }

  void _showImageSourceOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: 150,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _pickImage(ImageSource source) async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: source);
    if (file != null) {
      ChatMessage chatMessage = ChatMessage(
        user: currentUser,
        createdAt: DateTime.now(),
        text: "Describe this picture?",
        medias: [
          ChatMedia(
              url: file.path, fileName: "", type: MediaType.image)
        ],
      );
      _sendMessage(chatMessage);
    }
  }

  void _sendWelcomeMessage() {
    ChatMessage welcomeMessage = ChatMessage(
      user: geminiUser,
      createdAt: DateTime.now(),
      text: "Welcome to HiVE CHaT! How can I assist you today?",
    );
    _sendMessage(welcomeMessage);
  }
  void _startNewChat() {
    setState(() {
      messages.clear(); // Clear the current chat messages
    });
    _sendWelcomeMessage(); // Send the welcome message again for the new chat
  }


}


