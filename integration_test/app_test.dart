import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

// IMPORTANT: replace `your_package_name` with the real package name from pubspec.yaml
import 'package:patrol_workflow_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('launches and shows initial counter = 0', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Flutter Demo Home Page'), findsOneWidget);
    expect(find.text('You have pushed the button this many times:'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('tapping the FAB increments the counter', (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Verify initial
    expect(find.text('0'), findsOneWidget);

    // Tap the FAB by its tooltip (defined in your code as 'Increment')
    final fab = find.byTooltip('Increment');
    expect(fab, findsOneWidget);

    await tester.tap(fab);
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    // Tap a few more times to be sure state updates correctly hello d
    await tester.tap(fab);
    await tester.tap(fab);
    await tester.pumpAndSettle();
    expect(find.text('3'), findsOneWidget);
  });
}
