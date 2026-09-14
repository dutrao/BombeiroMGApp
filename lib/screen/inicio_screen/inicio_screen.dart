import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/inicio_screen/aviso_dados_dialog.dart';
import 'package:flutter_application_1/screen/inicio_screen/logout_dialog.dart';
import 'package:flutter_application_1/constants/constants.dart';
import 'package:flutter_application_1/model/militar.dart';
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

  Future<void> _sincronizarAnuncioViatura(Storage storage) async {
    await storage.sincronizarAnuncioViaturaDiarioNuvemParaLocal();

    await storage.sincronizarAnuncioViaturaNuvemParaLocal();
  }

  Future<void> _sincronizarAnuncioOcorrencia(Storage storage) async {
    await storage.sincronizarAnuncioOcorrenciaDiarioNuvemParaLocal();

    await storage.sincronizarAnuncioOcorrenciaNuvemParaLocal();
  }

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
        return const PerfilScreen();
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await carregarDados();
      },
      child: Stack(
        children: [
          Scaffold(
            body: paginaCentral,
            backgroundColor: const Color(0xfff9f9f9),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: currentIndex,
              onTap: (value) async {
                if (value == 1) {
                  Militar? militar = await context
                      .read<Storage>()
                      .pegarDadosUsuario();

                  if (militar == null) {
                    mostrarVerificacaoDadosPerfilDialog();
                    return;
                  }
                }

                if (value == 3) {
                  mostrarLogoutDialog();
                  return;
                }

                setState(() {
                  currentIndex = value;
                });
              },
              items: const [
                BottomNavigationBarItem(
                  key: ValueKey(
                    Constants.inicioScreenHomeBottomNavigatonbarItem,
                  ),
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
                /*BottomNavigationBarItem(
                key: ValueKey(Constants.inicioScreenChatBottomNavigatonbarItem),
                icon: Icon(Icons.chat),
                label: 'Chat',
              ),*/
                BottomNavigationBarItem(
                  key: ValueKey(
                    Constants.inicioScreenPerfilBottomNavigatonbarItem,
                  ),
                  icon: Icon(Icons.person),
                  label: 'Perfil',
                ),
                BottomNavigationBarItem(
                  key: ValueKey(
                    Constants.inicioScreenSairBottomNavigatonbarItem,
                  ),
                  icon: Icon(Icons.logout),
                  label: 'Sair',
                ),
              ],
            ),
          ),
          if (carregandoDados) ...[
            ModalBarrier(color: Colors.black38),
            Center(child: CircularProgressIndicator()),
          ],
        ],
      ),
    );
  }

  Future<void> carregarDados() async {
    final storage = context.read<Storage>();

    try {
      if (mounted) {
        setState(() {
          carregandoDados = true;
        });
      }

      // ==========================================
      // 1 - DADOS PRINCIPAIS
      // Podem sincronizar simultaneamente
      // ==========================================

      await Future.wait([
        storage.sincronizarMilitarNuvemParaLocal(),
        storage.sincronizarViaturaNuvemParaLocal(),
        storage.sincronizarOcorrenciaNuvemParaLocal(),
        storage.sincronizarDemandaNuvemParaLocal(),
        storage.sincronizarCursoNuvemParaLocal(),
      ]);

      // ==========================================
      // 2 - CARREGA MILITARES NA MEMÓRIA
      // Necessário para o EfetivoCard
      // ==========================================

      await storage.atualizarListaTodosMilitares();

      // ==========================================
      // 3 - ANÚNCIO DE EFETIVO
      // IMPORTANTE: manter nessa ordem
      // ==========================================

      await storage.sincronizarAnuncioMilitarDiarioNuvemParaLocal();

      await storage.sincronizarAnuncioMilitarNuvemParaLocal();

      await storage.atualizarListaAnuncioMilitarCompleta();

      // ==========================================
      // 4 - OUTROS ANÚNCIOS
      // Podem executar em paralelo entre si
      // ==========================================

      await Future.wait([
        _sincronizarAnuncioViatura(storage),
        _sincronizarAnuncioOcorrencia(storage),
        storage.sincronizarMilitarCursoNuvemParaLocal(),
      ]);

      // ==========================================
      // 5 - ATUALIZA LISTAS DA INTERFACE
      // ==========================================

      await Future.wait([
        storage.atualizarListaDemandas(),
        storage.atualizarListaDeOcorrenciaUltimoAnuncio(),
        storage.atualizarListaCursos(),
      ]);
    } catch (e, stackTrace) {
      debugPrint('Erro ao carregar dados: $e');

      debugPrint('StackTrace: $stackTrace');
    } finally {
      if (mounted) {
        setState(() {
          carregandoDados = false;
        });
      }
    }
  }

  void mostrarVerificacaoDadosPerfilDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return const VerificacaoDadosPerfilDialog();
      },
    );
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
