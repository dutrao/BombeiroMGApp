import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseStorageService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<void> uploadFotoUsuario(bytes) async {
    await _storage.ref('${_auth.currentUser!.uid}/fotoUsuario').putData(bytes);
  }

  Future<String?> pegarUrlFotoUsuario() async {
    try {
      return await _storage
          .ref('${_auth.currentUser!.uid}/fotoUsuario')
          .getDownloadURL();
    } on FirebaseException {
      return null;
    }
  }

    Future<void> uploadDemanda(bytes, String idDemanda) async {
    try {
  await _storage.ref('demandas/$idDemanda').putData(bytes);
} on FirebaseException catch (e) {
  print('houve um erro: $e');
}
  }

  Future<String?> pegarUrlDemandaPorId(String idDemanda) async {
    try {
      return await _storage
          .ref('demandas/$idDemanda')
          .getDownloadURL();
    } on FirebaseException {
      return null;
    }
  }
}
