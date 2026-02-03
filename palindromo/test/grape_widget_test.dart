import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:palindromo/view/grape_view.dart';

void main() {
  testWidgets('muestra campo de texto y radio buttons', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: GrapeView()));

    expect(find.byType(TextField), findsOneWidget);
    expect(find.text('Tipo:'), findsOneWidget);
    expect(find.text('Tamaño:'), findsOneWidget);
    expect(find.text('A'), findsOneWidget);
    expect(find.text('B'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets('calcula precio para tipo A tamaño 1', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: GrapeView()));

    await tester.enterText(find.byType(TextField), '100');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Ajuste: +20¢'), findsOneWidget);
    expect(find.text('Precio final: 120¢'), findsOneWidget);
  });

  testWidgets('calcula precio para tipo A tamaño 2', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: GrapeView()));

    await tester.enterText(find.byType(TextField), '100');
    
    final radioButtons = find.byType(Radio<bool>);
    await tester.tap(radioButtons.at(3));
    await tester.pump();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Ajuste: +30¢'), findsOneWidget);
    expect(find.text('Precio final: 130¢'), findsOneWidget);
  });

  testWidgets('calcula precio para tipo B tamaño 1', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: GrapeView()));

    await tester.enterText(find.byType(TextField), '100');
    
    final radioButtons = find.byType(Radio<bool>);
    await tester.tap(radioButtons.at(1));
    await tester.pump();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Ajuste: -30¢'), findsOneWidget);
    expect(find.text('Precio final: 70¢'), findsOneWidget);
  });

  testWidgets('calcula precio para tipo B tamaño 2', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: GrapeView()));

    await tester.enterText(find.byType(TextField), '100');
    
    final radioButtons = find.byType(Radio<bool>);
    await tester.tap(radioButtons.at(1));
    await tester.pump();
    await tester.tap(radioButtons.at(3));
    await tester.pump();

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text('Ajuste: -50¢'), findsOneWidget);
    expect(find.text('Precio final: 50¢'), findsOneWidget);
  });
}
