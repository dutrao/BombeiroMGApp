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

      if(user!= null){
        await user.sendEmailVerification();
        await _auth.signOut();        
      }
      
    } on FirebaseAuthException catch (e) {
      print(e.code);
      rethrow;
    }
  }

  String pegarUuidUsuario(){
    return _auth.currentUser!.uid;
  }

  Future<void> autenticarUsuario(String email, String password) async {
    
     final credencial = await _auth.signInWithEmailAndPassword(email: email, password: password);

     final user = credencial.user;

     if(user ==null)return;

     await user.reload();

     final usuarioAtualizado = _auth.currentUser;

     if(usuarioAtualizado?.emailVerified != true){
      await _auth.signOut();         
     }

   
  }

  Future<void>solicitarSenhaPorEmail(String email)async{
   await _auth.sendPasswordResetEmail(email: email);
  }

  bool verificarSeUsuarioLogado(){
    if(_auth.currentUser == null){
      return false;
    }else{
      return true;
    }
  }

  void deslogar() {
    _auth.signOut();
  }
}
