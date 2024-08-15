import 'package:flutter_test/flutter_test.dart';
import 'package:food_recipe_app/presentation/component/medium_button.dart';
import 'package:food_recipe_app/core/di/di_setup.dart';
import 'package:food_recipe_app/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  group('end to end', () {
    testWidgets('첫 화면에서 Start 버튼 누르면 로그인 화면으로 이동', (tester) async {
      await tester.pumpWidget(const MyApp());

      final startButton = find.byType(MediumButton);
      expect(startButton, findsOneWidget);

      await tester.tap(startButton);

      await tester.pumpAndSettle();

      final helloText = find.text('Hello');
      expect(helloText, findsOneWidget);
    });
  });
}
