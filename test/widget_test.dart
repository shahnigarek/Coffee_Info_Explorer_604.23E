import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:coffee_info_explorer/main.dart';

void main() {
  testWidgets('CoffeeInfoExplorerApp loads and displays HomePage', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(CoffeeInfoExplorerApp());

    await tester.pumpAndSettle();

    expect(find.text('Coffee Info Explorer'), findsOneWidget);

    expect(find.byType(Card), findsWidgets);
  });
}
