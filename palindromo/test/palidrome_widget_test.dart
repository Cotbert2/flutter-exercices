import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:palindromo/view/palindrome_view.dart';

void main() {
  testWidgets('muestra campo de texto y boton', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PalindromeView()));

    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    expect(find.text('Comprobar'), findsOneWidget);
  });

  testWidgets('muestra snackbar para campo vacio', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PalindromeView()));

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('ingresar campo'), findsOneWidget);
  });

  testWidgets('muestra snackbar es palindromo', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PalindromeView()));

    await tester.enterText(find.byType(TextField), 'oso');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('es palindromo'), findsOneWidget);
  });

  testWidgets('muestra snackbar no es palindromo', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PalindromeView()));

    await tester.enterText(find.byType(TextField), 'casa');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('no es palindromo'), findsOneWidget);
  });

  testWidgets('valida espacios en blanco', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PalindromeView()));

    await tester.enterText(find.byType(TextField), '   ');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('ingresar campo'), findsOneWidget);
  });
}
