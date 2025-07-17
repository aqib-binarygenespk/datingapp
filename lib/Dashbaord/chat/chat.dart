
import 'package:dating_app/themesfolder/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


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
  bool _showHeartReaction = false;
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;


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
// Toggle the visibility of the emoji picker
  void _toggleEmojiPicker() {
    setState(() {
      _isEmojiPickerVisible = !_isEmojiPickerVisible;
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

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path); // Store the selected image
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,


        body:Column(
          children: [
            // 🔥 PairUp logo with reduced height for compact spacing
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset(
                  'assets/the_pairup_logo_black.png',
                  height: 70, // 🔥 reduced from 90 to 70 for tighter spacing
                ),
              ),
            ),

            // ✅ Back button, title, three-dot menu row with controlled height
            SizedBox(
              height: 40, // 🔥 adjust as needed to match exact Figma spacing
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                      padding: EdgeInsets.zero, // 🔥 removes default padding
                      constraints: const BoxConstraints(), // 🔥 removes default constraints
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        "New Year's Eve Event",
                        style: AppTheme.textTheme.bodyLarge,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.more_vert, color: Colors.black),
                      onPressed: () {
                        _showBottomSheet2(context);
                      },
                      padding: EdgeInsets.zero, // 🔥 removes default padding
                      constraints: const BoxConstraints(), // 🔥 removes default constraints
                    ),
                  ],
                ),
              ),
            ),

            const Divider(thickness: 1, height: 1, color: Colors.black12),

            // ✅ Chat header with profile details
            _buildChatHeaderCard(),

            const Divider(thickness: 1, height: 1, color: Colors.black12),

            // ✅ Chat messages placeholder
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                children: [
                  _buildMessageDate("Oct 1st, 2024"),
                  GestureDetector(
                    onLongPress: () {
                      _showBottomSheet(context, "Hi, Amelia! How’s your week going?");
                    },
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: _buildChatBubble(
                            message: "Hi, Amelia! How’s your week going?",
                            isSentByMe: false,
                          ),
                        ),
                        if (_showHeartReaction)
                          const Positioned(
                            bottom: 10,
                            right: 65,
                            child: Padding(
                              padding: EdgeInsets.only(right: 8.0, bottom: 2),
                              child: Icon(Icons.favorite, color: Colors.red, size: 16),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Input messages list
            Expanded(
              child: ListView.builder(
                itemCount: _messages.length,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return GestureDetector(
                    onLongPress: () {
                      // Show your emoji/action sheet
                    },
                    child: _buildChatBubble(
                      message: message['text'],
                      audio: message['audio'],
                      isSentByMe: message['isSentByMe'],
                    ),
                  );
                },
              ),
            ),

            const Divider(thickness: 1, height: 1, color: Colors.black12),

            // ✅ Bottom input bar with keyboard-aware padding
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: _buildInputBar(),
            ),
          ],
        ),

    );
  }
  Widget _buildChatHeaderCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Card(
        color:  Color(0xFFF7DBDD), // Soft pink background color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Transform.translate(
                offset: const Offset(0, 10), // Adjust the offset to move image down (vertical position)
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40), // For rounded corners on the profile image
                  child: Image.asset(
                    'assets/dpjohn.png', // Update with your image path
                    width: 85, // Slightly larger profile picture
                    height: 90,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Increase spacing between profile image and text

              Container(
                height: 110, // The height of the line
                width: 1, // Same width as the profile image
                color: Colors.black45, // Grey color for the line
              ),
              const SizedBox(width: 10),
               Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mark C",
                      style: AppTheme.textTheme.titleLarge,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "29, 5'9\"",
                      style: AppTheme.textTheme.titleSmall,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Location Details Here . . .",
                      style: AppTheme.textTheme.titleMedium,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Lorem Ipsum Has Been The Industry's Standard...",
                      style: AppTheme.textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
              Container(
                width: 27, // Circle diameter
                height: 27,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black, // Black circle background
                ),
                child: Center(
                  child: ColorFiltered(
                    colorFilter: ColorFilter.mode(
                      Colors.white, // White color filter to change image color
                      BlendMode.srcIn,
                    ),
                    child: Image.asset(
                      'assets/video.png',
                      width: 20, // Reduced width of image to make it smaller
                      height: 20, // Reduced height of image to make it smaller
                      fit: BoxFit.contain, // Ensures image maintains its aspect ratio while being contained
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }



  Widget _buildChatBubble({
    String? message,
    String? audio,
    required bool isSentByMe,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
        isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSentByMe) ...[
            // Show avatar for received message
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/dpjohn.png',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 40),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: isSentByMe ? Colors.white60 : const Color(0xFFF7DBDD),
                    borderRadius: BorderRadius.circular(3.0),
                    border: Border.all(
                      color: const Color(0x1A111827), // #111827 with 10% opacity
                      width: 1,
                    ),
                  ),
                  child: audio != null
                      ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          _player.isPlaying ? Icons.stop : Icons.play_arrow,
                        ),
                        onPressed: () => _playAudio(audio),
                      ),
                      const SizedBox(width: 8),
                      const Text("Audio Message"),
                    ],
                  )
                      : Text(
                    message ?? "",
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: isSentByMe ? Colors.black : Colors.black,
                    ),
                  ),
                ),
                if (isSentByMe) ...[
                  Positioned(
                    right: 0,
                    top: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/dpjohn.png',
                        width: 32,
                        height: 32,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }



  void _showBottomSheet(BuildContext context, String message) {
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
                Navigator.pop(context);
                setState(() {
                  _showHeartReaction = true;
                });
              },
            ),
            const Divider(color: Colors.grey, thickness: 0.5, indent: 40, endIndent: 40),
            _buildCenteredButton(
              Icons.copy,
              "Copy",
              onPressed: () {
                Clipboard.setData(ClipboardData(text: message));
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Message copied to clipboard')),
                );
              },
            ),
            const Divider(color: Colors.grey, thickness: 0.5, indent: 40, endIndent: 40),
            _buildCenteredButton(
              Icons.flag_outlined,
              "Flag",
              onPressed: () {
                Navigator.pop(context);
                // open flag sheet
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.white,
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
      backgroundColor: AppTheme.backgroundColor, // ✅ updated background color
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
                print("Expire pressed");
              },
            ),
            const Divider(color: Colors.grey, thickness: 0.5, indent: 40, endIndent: 40),
            _buildCenteredButton(
              Icons.block,
              "Block",
              onPressed: () {
                Navigator.pop(context);
                _showBottomSheetblock(context);
              },
            ),
            const Divider(color: Colors.grey, thickness: 0.5, indent: 40, endIndent: 40),
            _buildCenteredButton(
              Icons.flag_outlined,
              "Flag",
              onPressed: () {
                Navigator.pop(context);
                _showFlagBottomSheet(context);
              },
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: Text(
                  "Cancel",
                  style: AppTheme.textTheme.labelLarge?.copyWith(
                    color: AppTheme.backgroundColor,// ✅ updated text color

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

  Widget _buildCenteredButton(IconData icon, String label, {VoidCallback? onPressed}) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: const Color(0xFF111827)),
      label: Text(
        label,
        style: AppTheme.textTheme.labelLarge?.copyWith(
          color: const Color(0xFF111827), // ✅ updated text color
        ),
      ),
    );
  }

// Helper widget to create centered buttons

  void _showFlagBottomSheet(BuildContext context) {
    String selectedOption = '';
    bool showReasonField = false;
    final TextEditingController _reasonController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppTheme.backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),
                    ...[
                      "Inappropriate Content",
                      "Harassment or Abuse",
                      "Fake Profile",
                      "Spam or Scamming",
                      "Offensive Behavior",
                      "Misleading Information",
                      "Safety Concerns",
                      "Other",
                    ].map((option) => Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedOption = option;
                              showReasonField = option == "Other";
                            });
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              option,
                              textAlign: TextAlign.center,
                              style: AppTheme.textTheme.bodyMedium?.copyWith(
                                color: Colors.black, // ✅ always black
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Color(0xFFC9C9C9),
                          thickness: 0.5,
                          indent: 40,
                          endIndent: 40,
                        ),
                      ],
                    )),
                    if (showReasonField)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextField(
                          controller: _reasonController,
                          decoration: InputDecoration(
                            hintText: "Write reason",
                            hintStyle: AppTheme.textTheme.bodyMedium?.copyWith(
                              color: const Color(0xFF111827).withOpacity(0.5),
                            ),
                            filled: true,
                            fillColor: AppTheme.backgroundColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(color: Color(0x66B8B8B8)),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8), // ✅ reduced height
                          ),
                          style: AppTheme.textTheme.bodyMedium?.copyWith(
                            color: Colors.black,
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
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: AppTheme.textTheme.labelLarge?.copyWith(
                          color: AppTheme.backgroundColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
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
      backgroundColor: AppTheme.backgroundColor, // ✅ Bottom sheet background
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
              // Block Heading
              Text(
                "Block?",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 40,
                endIndent: 40,
              ),
              Text(
                "Are you sure you want to block\nthis match?",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Colors.black,
                )
              ),
              const Divider(
                color: Colors.grey,
                thickness: 0.5,
                indent: 40,
                endIndent: 40,
              ),
              const SizedBox(height: 20),

              // TextField for Reason
              TextField(
                decoration: InputDecoration(
                  hintText: "Write reason",
                  filled: true,
                  fillColor: AppTheme.backgroundColor, // ✅ TextField background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // ✅ radius 8
                    borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // ✅ radius 8
                    borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // ✅ radius 8
                    borderSide: const BorderSide(color: Color(0xFFD9D9D9), width: 1),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
                maxLines: 2,
              ),
              const SizedBox(height: 20),

              // Row with Cancel and Block buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          side: const BorderSide(color: Colors.black, width: 2.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      child: Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color:Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // Add block functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                      ),
                      child: Text(
                        "Block",
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          color: AppTheme.backgroundColor,
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
        color: AppTheme.backgroundColor,
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppTheme.backgroundColor,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: const Color(0xFFC9C9C9),
                  width: 0.5,
                ),
              ),
              child: Row(
                children: [
                  // ✅ Emoji icon inside input field
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.black),
                    onPressed: _toggleEmojiPicker,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      style: Theme.of(context).textTheme.bodySmall,
                      decoration: const InputDecoration(
                        fillColor: AppTheme.backgroundColor,
                        hintText: "Write Your Message",
                        hintStyle: TextStyle(color: Colors.black45),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.photo_library_outlined, color: Colors.black),
                    onPressed: _pickImage,
                  ),
                  // ✅ Mic or Send button styled as dark circle icon
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: Icon(
                        _messageController.text.isEmpty ? Icons.mic : Icons.send,
                        color: Colors.white,
                      ),
                      onPressed: _messageController.text.isEmpty
                          ? _startRecording
                          : _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
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