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
    await  tester.pumpWidget(
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
    await  tester.pumpAndSettle();
    expect(find.text('Login'), findsOneWidget);

   await tester.enterText(find.byKey(Key('campoEmail')), 'lucas.cabral@bombeiros.mg.gov.br');
   await  tester.enterText(find.byKey(Key('campoSenha')), '123321');
   await tester.tap(find.byKey(Key('textoLogin')));
   await tester.tap(find.byKey(Key('botaoEntrar')));
   
   await tester.pumpAndSettle(Duration(seconds: 4));

    expect(find.textContaining('Olá'), findsOneWidget);
    });

  });
}
