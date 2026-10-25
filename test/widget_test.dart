import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kantin_kampus_tema/main.dart';

void main() {
  testWidgets('KantinKampusApp smoke test and cart interaction',
      (WidgetTester tester) async {
    await tester.pumpWidget(const KantinKampusApp());
    await tester.pumpAndSettle();

    // Verify initial product list
    expect(find.text('Nasi Goreng'), findsOneWidget);
    expect(find.text('Es Teh Manis'), findsOneWidget);
    expect(find.text('Ayam Geprek'), findsOneWidget);

    // Add Nasi Goreng to cart
    final addButtons = find.byIcon(Icons.add_circle);
    expect(addButtons, findsWidgets);
    await tester.tap(addButtons.first);
    await tester.pumpAndSettle();

    // Navigate to Keranjang
    await tester.tap(find.text('Keranjang'));
    await tester.pumpAndSettle();

    // Verify item in cart and summary bar
    expect(find.text('1 item • Rp15000'), findsOneWidget);
    expect(find.text('Kosongkan'), findsOneWidget);

    // Toggle theme
    final themeToggle = find.byType(IconButton).first;
    await tester.tap(themeToggle);
    await tester.pumpAndSettle();
  });
}
