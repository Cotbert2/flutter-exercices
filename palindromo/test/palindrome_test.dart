import 'package:flutter_test/flutter_test.dart';
import 'package:palindromo/controller/palindrome_controller.dart';

void main() {
  test('palabra palindromo simple', () {
    expect(PalindromeController.isPalindrome('oso'), true);
  });

  test('palabra palindromo con mayusculas', () {
    expect(PalindromeController.isPalindrome('Reconocer'), true);
  });

  test('palabra que no es palindromo', () {
    expect(PalindromeController.isPalindrome('casa'), false);
  });

  test('frase palindromo', () {
    expect(PalindromeController.isPalindrome('anitalavalatina'), true);
  });

  test('palabra vacia', () {
    expect(PalindromeController.isPalindrome(''), true);
  });
}
