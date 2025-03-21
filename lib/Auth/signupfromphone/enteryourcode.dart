import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  _VerificationCodeScreenState createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> with CodeAutoFill {
  int _timerSeconds = 30;
  List<TextEditingController> _controllers = [];
  String _code = "";

  @override
  void initState() {
    super.initState();
    _startTimer();
    listenForCode();
    _controllers = List.generate(4, (_) => TextEditingController());
  }

  @override
  void dispose() {
    cancel(); // Stop listening for the code
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          if (_timerSeconds > 0) _timerSeconds--;
        });
        if (_timerSeconds > 0) _startTimer();
      }
    });
  }

  @override
  void codeUpdated() {
    setState(() {
      _code = code ?? "";
      _setCodeToFields(_code);
    });
  }

  void _setCodeToFields(String code) {
    for (int i = 0; i < code.length; i++) {
      _controllers[i].text = code[i];
    }
  }

  Widget _buildCodeBox(int index) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: _controllers[index],
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          maxLength: 1,
          obscureText: true, // Hides each digit with a dot
          style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 24),
          decoration: const InputDecoration(
            border: InputBorder.none,
            counterText: '',
          ),
          onChanged: (value) {
            if (value.isNotEmpty && index < _controllers.length - 1) {
              FocusScope.of(context).nextFocus(); // Move to the next field
            } else if (value.isEmpty && index > 0) {
              FocusScope.of(context).previousFocus(); // Move to the previous field
            }
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter Your Code",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter the verification code we sent to 0123456789",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) => _buildCodeBox(index)),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                String enteredCode = _controllers.map((e) => e.text).join();
                if (enteredCode.length == 4) {
                  // Add verification functionality here
                  Navigator.popAndPushNamed(context, '/EnterPassword');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF111827),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Verify"),
            ),
            const SizedBox(height: 20),
            Text(
              "Resend Code in 00:${_timerSeconds.toString().padLeft(2, '0')}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
