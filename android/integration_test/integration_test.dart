import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  late AppDatabase database;

  setUpAll(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await FirebaseAuth.instance.signOut();
  });
  setUp(() async {
    database = AppDatabase();
  });

  tearDown(() async {
    await database.close();
  });
  group('testando cadastro', () {
    testWidgets('testando cadastramento', (tester) async {
      await tester.pumpWidget(
        MultiProvider(
          providers: [
            Provider<AppDatabase>.value(value: database),
            Provider<Repository>(
              create: (context) =>
                  Repository(database: context.read<AppDatabase>()),
            ),
            ChangeNotifierProvider(
              create: (context) =>
                  Storage(repository: context.read<Repository>()),
            ),
          ],
          child: const MyApp(),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('Clique aqui para criar sua conta'), findsOneWidget);

      await tester.tap(find.text('Clique aqui para criar sua conta'));
      await tester.pumpAndSettle();

      expect(find.text('Cadastrar'), findsOneWidget);
      expect(
        find.byKey(ValueKey(Constants.cadastroEmailTextFormField)),
        findsOneWidget,
      );
      expect(
        find.byKey(ValueKey(Constants.cadastroSenhaTextFormField)),
        findsOneWidget,
      );
      expect(
        find.byKey(ValueKey(Constants.cadastroConfirmTextFormField)),
        findsOneWidget,
      );

      await tester.enterText(
        find.byKey(ValueKey(Constants.cadastroEmailTextFormField)),
        'joao@gmail.com',
      );
      await tester.enterText(
        find.byKey(ValueKey(Constants.cadastroSenhaTextFormField)),
        '123321',
      );
      await tester.enterText(
        find.byKey(ValueKey(Constants.cadastroConfirmTextFormField)),
        '123321',
      );
      await tester.tap(find.text('Cadastrar'));
      await tester.pumpAndSettle(Duration(seconds: 2));
      /*await tester.runAsync(()async {
        await usuario
      },)*/
    });
  });
}
