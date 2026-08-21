import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/database/database.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';

/*@GenerateNiceMocks([
  MockSpec<FirebaseFirestore>(),
  MockSpec<QuerySnapshot>(),
  MockSpec<CollectionReference>(),
  MockSpec<QueryDocumentSnapshot>(),
  MockSpec<FirebaseAuth>(),
])*/
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('tester de integração', () {
    final database = AppDatabase();
    setUpAll(() async {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      await FirebaseAuth.instance.signOut();
    });
    testWidgets('realizar login', (tester) async {
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

      print('ERRO 1: ${tester.takeException()}');

      expect(find.text('Login'), findsOneWidget);

      await tester.enterText(
        find.byKey(const Key('campoEmail')),
        'lucas.cabral@bombeiros.mg.gov.br',
      );

      await tester.pump();

      print('ERRO 2 - depois email: ${tester.takeException()}');

      await tester.enterText(find.byKey(const Key('campoSenha')), '123321');

      await tester.pump();

      print('ERRO 3 - depois senha: ${tester.takeException()}');

      FocusManager.instance.primaryFocus?.unfocus();

      await tester.pumpAndSettle();

      print('ERRO 4 - depois unfocus: ${tester.takeException()}');

      await tester.tap(find.byKey(const Key('botaoEntrar')));

      await tester.pumpAndSettle(const Duration(seconds: 4));

      print('ERRO 5 - depois login: ${tester.takeException()}');

      print('Achou Olá: ${find.textContaining('Olá').evaluate().length}');

      expect(find.textContaining('Olá'), findsOneWidget);
    });
  });
}
