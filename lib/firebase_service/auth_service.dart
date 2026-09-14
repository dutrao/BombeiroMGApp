import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> cadastrarUsuario(String email, String password) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = response.user;

      if (user != null) {
        await user.sendEmailVerification();
        await _auth.signOut();
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      rethrow;
    }
  }

  String pegarUuidUsuario() {
    return _auth.currentUser!.uid;
  }

  Future<UserCredential> autenticarUsuario(
    String email,
    String password,
  ) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> reenviarEmailConfirmacao(String email, String senha) async {
    try {
      final credencial = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: senha,
      );

      final user = credencial.user;

      if (user == null) {
        throw Exception('Não foi possível localizar o usuário.');
      }

      await user.reload();

      final usuarioAtualizado = _auth.currentUser;

      if (usuarioAtualizado == null) {
        throw Exception('Usuário não encontrado.');
      }

      if (usuarioAtualizado.emailVerified) {
        throw Exception('Esta conta já foi confirmada.');
      }

      await usuarioAtualizado.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'too-many-requests') {
        throw Exception(
          'Muitas tentativas em pouco tempo. '
          'Aguarde alguns minutos e tente novamente.',
        );
      }

      if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        throw Exception('E-mail ou senha incorretos.');
      }

      if (e.code == 'user-not-found') {
        throw Exception('Usuário não encontrado.');
      }

      rethrow;
    } finally {
      await _auth.signOut();
    }
  }

  Future<void> solicitarSenhaPorEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  bool verificarSeUsuarioLogado() {
    if (_auth.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  void deslogar() {
    _auth.signOut();
  }
}
