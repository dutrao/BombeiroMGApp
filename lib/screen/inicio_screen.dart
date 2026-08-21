import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/logout_dialog.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:flutter_application_1/screen/administradores_screen/administradores_screen.dart';
import 'package:flutter_application_1/screen/chat_screen/home_chat_screen.dart';
import 'package:flutter_application_1/screen/home_screen/home_screen.dart';
import 'package:flutter_application_1/screen/perfil_screen/perfil_screen.dart';
import 'package:flutter_application_1/storage/storage.dart';
import 'package:provider/provider.dart';

class InicioScreen extends StatefulWidget {
  const InicioScreen({super.key});

  @override
  State<InicioScreen> createState() => _InicioScreenState();
}

class _InicioScreenState extends State<InicioScreen> {
  int currentIndex = 0;
  bool carregandoDados = true;

  @override
  void initState() {
    super.initState();
    Future.microtask(carregarDados);    
  }
 

  Widget get paginaCentral {
    switch (currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const AdministradorScreen();
      case 2:
        return const HomeChatScreen();
      case 3:
        return const PerfilScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {    
    return RefreshIndicator(
      onRefresh: ()async {
        await carregarDados();        
      },
      child: Stack(
        children: [Scaffold(
          body:paginaCentral, 
          backgroundColor: const Color(0xfff9f9f9),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (value) {
              if (value == 4) {
                mostrarLogoutDialog();
                return;
              }
        
              setState(() {
                currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                key: ValueKey(Constants.inicioScreenHomeBottomNavigatonbarItem),
                icon: Icon(Icons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                key: ValueKey(
                  Constants.inicioScreenAdministradoresBottomNavigatonbarItem,
                ),
                icon: Icon(Icons.settings),
                label: 'Administradores',
              ),
              BottomNavigationBarItem(
                key: ValueKey(Constants.inicioScreenChatBottomNavigatonbarItem),
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),
              BottomNavigationBarItem(
                key: ValueKey(Constants.inicioScreenPerfilBottomNavigatonbarItem),
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
              BottomNavigationBarItem(
                key: ValueKey(Constants.inicioScreenSairBottomNavigatonbarItem),
                icon: Icon(Icons.logout),
                label: 'Sair',
              ),
            ],
          ),
        ), if(carregandoDados)...[ModalBarrier(color: Colors.black26,), Center(child: CircularProgressIndicator())]]
      ),
    );
  }

  Future<void> carregarDados() async {
    final repository = context.read<Repository>();
    final storage = context.read<Storage>();
    try {
      await repository.sincronizarMilitaresDriftComFirebase();
      await storage.sincronizarMilitarLocalComNuvem();
      await storage
          .sincronizarAnuncioMilitarDiarioNuvemParaLocal();
      await storage.sincronizarAnuncioMilitarNuvemParaLocal();
      await storage.sincronizarViaturaNuvemParaLocal();
      await storage
          .sincronizarAnuncioViaturaDiarioNuvemParaLocal();
      await storage.sincronizarAnuncioViaturaNuvemParaLocal();
      await storage.sincronizarOcorrenciaNuvemParaLocal();
      await storage
          .sincronizarAnuncioOcorrenciaNuvemParaLocal();
      await storage
          .sincronizarAnuncioOcorrenciaDiarioNuvemParaLocal();
      await storage.sincronizarDemandaNuvemParaLocal();
      await storage.atualizarDemandas();
      await storage.sincronizarCursoNuvemParaLocal();
      await storage.sincronizarMilitarCursoNuvemParaLocal();
      await storage.carregarListaAnuncioMilitarCompleta();
      await storage.atualizarListaDeOcorrenciaUltimoAnuncio();      
      await storage.atualizarListaTodosMilitares();
      await storage.atualizarListaCursos();

      if (!mounted) {
        return;
      } 
       
    } on Exception catch (e) {
      print('erro ao carregar os dados: $e');
    } finally{
       setState(() {
          carregandoDados = false;
        });
      

    }
  }

  void mostrarLogoutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const LogoutDialog();
      },
    );
  }
}
