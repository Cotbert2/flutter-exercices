class PalindromeController {
  static bool isPalindrome(String input) {
    String sanitized = input.toLowerCase();
    String reversed = '';

    for (int i = sanitized.length - 1; i >= 0; i--) {
      reversed += sanitized[i];
    }
    return sanitized == reversed;
  }
}


//preba de escritorio

void main() {
  String testString = "Reconocer";
  bool result = PalindromeController.isPalindrome(testString);
  print('"$testString" is a palindrome: $result');
}