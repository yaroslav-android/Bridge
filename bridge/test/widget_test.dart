import 'package:bridge/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('blank test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
  });
}
