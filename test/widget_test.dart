import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:protofolio/main.dart';

void main() {
  testWidgets('Portfolio app loads and displays identity content', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const PortfolioApp(),
      ),
    );

    // Wait for initial shimmer loading duration to complete
    await tester.pumpAndSettle();

    // Verify name and title rendered
    expect(find.text('Muhamed Roshdy Al-Abd'), findsWidgets);
    expect(find.text('Senior Mobile Developer | Native Android & Flutter | Mobile Team Lead'), findsWidgets);
  });
}
