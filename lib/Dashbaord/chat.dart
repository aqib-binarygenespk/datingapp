
import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = []; // To store messages
  bool _isEmojiPickerVisible = false;
  bool _hasText = false;
  final FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  final FlutterSoundPlayer _player = FlutterSoundPlayer();
  bool _isRecording = false;
  String? _audioFilePath; // Tracks if the TextField has text

  @override
  void initState() {
    super.initState();

    // Initialize the recorder and player
    _initializeRecorder();
    _player.openPlayer();

    // Add listener for message controller
    _messageController.addListener(() {
      setState(() {
        _hasText = _messageController.text.isNotEmpty;
      });
    });
  }


  @override
  void dispose() {
    _recorder.closeRecorder();
    _player.closePlayer();
    super.dispose();
  }

  Future<void> _initializeRecorder() async {
    final status = await _recorder.openRecorder();
    if (status == null) {
      throw Exception("Microphone permissions not granted");
    }
  }

  Future<void> _startRecording() async {
    final directory = await getTemporaryDirectory();
    final filePath = "${directory.path}/audio_${DateTime
        .now()
        .millisecondsSinceEpoch}.aac";

    await _recorder.startRecorder(
      toFile: filePath,
    );

    setState(() {
      _isRecording = true;
      _audioFilePath = filePath;
    });
  }

  Future<void> _stopRecording() async {
    await _recorder.stopRecorder();

    setState(() {
      _isRecording = false;
      _messages.add({'audio': _audioFilePath, 'isSentByMe': true});
    });
  }

  Future<void> _playAudio(String filePath) async {
    if (_player.isPlaying) {
      await _player.stopPlayer();
    } else {
      await _player.startPlayer(fromURI: filePath);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Mark C",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        leading: SizedBox(
          width: 100, // Width to fit both back button and image container
          child: Row(
            children: [
              const SizedBox(width: 10),
              // Spacing between back button and container
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[500],
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.video_call_outlined, color: Colors.black, size: 30),
            onPressed: () {
              // Handle video call
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              _showBottomSheet2(context);
              // Handle more options
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat header with profile details
          _buildChatHeader(),
          const Divider(thickness: 1, height: 1, color: Colors.black12),
          // Chat messages placeholder
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 8.0),
              children: [
                _buildMessageDate("Oct 1st, 2024"),
                _buildChatBubble(
                  message: "Hi, Amelia! How’s your week going?",
                  isSentByMe: false,
                ),
              ],
            ),
          ),
          // Input bar
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0, vertical: 8.0),
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message['isSentByMe']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10.0),
                    decoration: BoxDecoration(
                      color: message['isSentByMe'] ? Colors.green[300] : Colors
                          .white,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Text(
                      message['text'],
                      style: TextStyle(
                        color: message['isSentByMe'] ? Colors.white : Colors
                            .black,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(thickness: 1, height: 1, color: Colors.black12),
          _buildInputBar(),
        ],
      ),
    );
  }

  Widget _buildChatHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "26, 5'9\"",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
                SizedBox(height: 4),
                Text(
                  "Location Details Here...",
                  style: TextStyle(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildChatBubble(
      {String? message, String? audio, required bool isSentByMe}) {
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Stack(
        children:[ Container(
          margin: const EdgeInsets.symmetric(vertical: 4.0),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: isSentByMe ? Colors.green[300] : Colors.white,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: audio != null
              ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(_player.isPlaying ? Icons.stop : Icons.play_arrow),
                onPressed: () => _playAudio(audio),
              ),
              const SizedBox(width: 8),
              const Text(
                "Audio Message",
                style: TextStyle(color: Colors.white),
              ),
            ],

          )

              : Text(
            message ?? "",
            style: TextStyle(
              color: isSentByMe ? Colors.white : Colors.black,
              fontSize: 14.0,
            ),
          ),
        ),
          Positioned(
            top: 3,
            right: 3,
            child: GestureDetector(
              onTap: () {
                _showBottomSheet(context);
                // Handle the action for three dots (e.g., showing a menu or options)
                print("Three dots clicked for message: $message");
              },
              child: const Icon(
                Icons.more_vert,
                size: 16,
                color: Colors.grey,
              ),
            ),
          ),],
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            _buildCenteredButton(
              Icons.favorite_border,
              "Heart",
              onPressed: () {
                print("Heart pressed");

                
              },
            ),
            const Divider(
                color: Colors.grey, thickness: 0.5, indent: 40, endIndent: 40),
            _buildCenteredButton(
              Icons.copy,
              "Copy",
              onPressed: () {
                print("Copy pressed");
              },
            ),
            const Divider(
                color: Colors.grey, thickness: 0.5, indent: 40, endIndent: 40),
            _buildCenteredButton(
              Icons.flag_outlined,
              "Flag",
              onPressed: () {
                Navigator.pop(context); // Close the current bottom sheet
                // Open the flag bottom sheet
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 12.0),  
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minimumSize: const Size(double.infinity, 50), // Full width
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.white, // White text
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }

  void _showBottomSheet2(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            _buildCenteredButton(
              Icons.timer_off_rounded,
              "Expire",
              onPressed: () {
                print("Heart pressed");
              },
            ),
            const Divider(
                color: Colors.grey, thickness: 0.5, indent: 40, endIndent: 40),
            _buildCenteredButton(
              Icons.block,
              "Block",
              onPressed: () {
                Navigator.pop(context);
                _showBottomSheetblock(context);
              },
            ),
            const Divider(
                color: Colors.grey, thickness: 0.5, indent: 40, endIndent: 40),
            _buildCenteredButton(
              Icons.flag_outlined,
              "Flag",
              onPressed: () {
                Navigator.pop(context);
                _showFlagBottomSheet(context);
                // Close the current bottom sheet
                // Open the flag bottom sheet
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Black background
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minimumSize: const Size(double.infinity, 50), // Full width
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.white, // White text
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        );
      },
    );
  }


// Helper widget to create centered buttons
  Widget _buildCenteredButton(IconData icon, String label,
      {VoidCallback? onPressed}) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showFlagBottomSheet(BuildContext context) {
    String selectedOption = '';
    bool showReasonField = false; // To manage visibility of the TextField
    final TextEditingController _reasonController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 12),
                  _buildFlagOption(
                      "Inappropriate Content", selectedOption, setState, () {
                    setState(() {
                      selectedOption = "Inappropriate Content";
                      showReasonField = false;
                    });
                  }),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  _buildFlagOption(
                      "Harassment or Abuse", selectedOption, setState, () {
                    setState(() {
                      selectedOption = "Harassment or Abuse";
                      showReasonField = false;
                    });
                  }),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  _buildFlagOption(
                      "Fake Profile", selectedOption, setState, () {
                    setState(() {
                      selectedOption = "Fake Profile";
                      showReasonField = false;
                    });
                  }),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  _buildFlagOption(
                      "Spam or Scamming", selectedOption, setState, () {
                    setState(() {
                      selectedOption = "Spam or Scamming";
                      showReasonField = false;
                    });
                  }),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  _buildFlagOption(
                      "Offensive Behavior", selectedOption, setState, () {
                    setState(() {
                      selectedOption = "Offensive Behavior";
                      showReasonField = false;
                    });
                  }),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  _buildFlagOption(
                      "Misleading Information", selectedOption, setState, () {
                    setState(() {
                      selectedOption = "Misleading Information";
                      showReasonField = false;
                    });
                  }),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  _buildFlagOption(
                      "Safety Concerns", selectedOption, setState, () {
                    setState(() {
                      selectedOption = "Safety Concerns";
                      showReasonField = false;
                    });
                  }),
                  const Divider(color: Colors.grey, thickness: 0.5),
                  _buildFlagOption("Other", selectedOption, setState, () {
                    setState(() {
                      selectedOption = "Other";
                      showReasonField = true; // Show TextField
                    });
                  }),
                  if (showReasonField)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextField(
                        controller: _reasonController,
                        decoration: const InputDecoration(
                          hintText: "Write reason",
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 2,
                      ),
                    ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (selectedOption == "Other") {
                        print("Reason: ${_reasonController.text}");
                      } else {
                        print("Selected Option: $selectedOption");
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      // Black background
                      minimumSize: const Size(double.infinity, 50),
                      // Full width
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white, // White text
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildFlagOption(String title, String selectedOption,
      StateSetter setState, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: title == selectedOption ? Colors.blue : Colors.black,
              // Highlight selected option
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }


  void _showBottomSheetblock(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const
              Text(
                "Block?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(color: Colors.grey,
                  thickness: 0.5,
                  indent: 40,
                  endIndent: 40), const Text(
                "Are you sure you want to block\nthis match?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Divider(color: Colors.grey,
                  thickness: 0.5,
                  indent: 40,
                  endIndent: 40),
              const SizedBox(height: 24),
              const TextField(
                decoration: InputDecoration(
                  hintText: "Write reason",
                  border: OutlineInputBorder(),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // White background
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(color: Colors.black,
                              width: 2.0), // Black border
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          color: Colors.black, // Black text
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  ),
                  const SizedBox(width: 16), // Spacing between buttons
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Add block functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        // Red background for block
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                      ),
                      child: const Text(
                        "Block",
                        style: TextStyle(
                          color: Colors.white, // White text
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }


  Widget _buildBottomSheetButton(IconData icon, String title,
      VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildMessageDate(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        date,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black54,
        ),
      ),
    );
  }


  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
                Icons.emoji_emotions_outlined, color: Colors.black54),
            onPressed: () {
              // Handle emoji picker
            },
          ),
          Expanded(
            child: TextField(
              controller: _messageController,
              decoration: InputDecoration(
                hintText: "Write Your Message",
                hintStyle: const TextStyle(color: Colors.black54),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              ),
            ),
          ),
          IconButton(
            icon: Icon(_messageController.text.isEmpty && !_isRecording
                ? Icons.mic
                : Icons.send, color: Colors.black),
            onPressed: _messageController.text.isEmpty && !_isRecording
                ? (_isRecording ? _stopRecording : _startRecording)
                : _sendMessage,
          ),
        ],
      ),
    );
  }

  void _sendMessage() {
    final text = _messageController.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _messages.add({'text': text, 'isSentByMe': true});
        _messageController.clear();
      });
    }
  }
}