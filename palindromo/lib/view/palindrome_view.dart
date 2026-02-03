import 'package:flutter/material.dart';
import 'package:palindromo/controller/palindrome_controller.dart';

class PalindromeView extends StatefulWidget {
  @override
  State<PalindromeView> createState() => _PalindromeViewState();
}

class _PalindromeViewState extends State<PalindromeView> {
  final TextEditingController _controller = TextEditingController();

  void _checkPalindrome() {
    String input = _controller.text;

    if (input.isEmpty || input.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('ingresar campo')),
      );
      return;
    }

    bool isPalindrome = PalindromeController.isPalindrome(input);

    String message = isPalindrome ? 'es palindromo' : 'no es palindromo';
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Palindromo')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingrese una palabra',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _checkPalindrome,
              child: Text('Comprobar'),
            ),
          ],
        ),
      ),
    );
  }
}
