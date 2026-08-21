import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/curso.dart';
import 'package:flutter_application_1/model/militar.dart';
import 'package:flutter_application_1/model/militar_curso.dart';
import 'package:flutter_application_1/repository/repository.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../storage/storage.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  TextEditingController nomeCompletoController = TextEditingController();
  TextEditingController nomeDeGuerraController = TextEditingController();
  TextEditingController numeroBMController = TextEditingController();
  TextEditingController funcaoController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cidadeController = TextEditingController();
  TextEditingController bairroController = TextEditingController();
  TextEditingController ruaController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  TextEditingController cepController = TextEditingController();
  TextEditingController complementoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController contatoController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController obsController = TextEditingController();
  TextEditingController naturalidadeController = TextEditingController();
  TextEditingController bancoController = TextEditingController();
  TextEditingController numeroContaController = TextEditingController();
  TextEditingController numeroAgController = TextEditingController();
  TextEditingController quantidadeAdiController = TextEditingController();

  ImagePicker imagePicker = ImagePicker();

  bool atualizandoDados = false;

  final _formKey = GlobalKey<FormState>();

  String? imagePath;

  String idMilitar = '';

  late Repository repository;

  final List<String> listaCargos = [
    'Cel',
    'Ten Cel',
    'Maj',
    'Cap',
    '1º Ten',
    '2º Ten',
    'Sub Ten',
    '1º Sgt',
    '2º Sgt',
    '3º Sgt',
    'Cb',
    'Sd',
  ];

  //DropDown controller
  String? cargoSelecionado;
  String? estadoCivilSelecionado;
  String? unidadeSelecionada;
  String? habilitacaoSelecionada;
  List<String> listaCursosDoMilitar = [];

  @override
  void initState() {
    Future.microtask(() async {
      repository = context.read<Repository>();
      atualizarFotoUsuario();
      carregarDadosUsuario();
      atualizarListaCursos();
      idMilitar = await pegarIdMilitarUsuario();
      await carregarCursosDosMilitar(idMilitar);
    });
    super.initState();
  }

  @override
  void dispose() {
    nomeCompletoController.dispose();
    nomeDeGuerraController.dispose();
    numeroBMController.dispose();
    funcaoController.dispose();
    cpfController.dispose();

    cidadeController.dispose();
    bairroController.dispose();
    ruaController.dispose();
    numeroController.dispose();
    cepController.dispose();
    complementoController.dispose();
    naturalidadeController.dispose();

    telefoneController.dispose();
    contatoController.dispose();
    dateController.dispose();
    obsController.dispose();

    bancoController.dispose();
    numeroContaController.dispose();
    numeroAgController.dispose();
    quantidadeAdiController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Curso> listaCursos = context.watch<Storage>().listaCursos;
    print('Lista cursos: ${listaCursos.length}');
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 220),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 50, 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(double.infinity, 50),
                          ),
                          onPressed: () async {
                            await salvarFotoBancoDeDados();
                            await atualizarFotoUsuario();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Atualizar Imagem de Perfil',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(width: 20),
                              Icon(Icons.upload),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.person),
                                    Text(
                                      'Dados do militar',
                                      style: TextStyle(
                                        color: Color(0xff8d1917),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Nome Completo',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: nomeCompletoController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: João da Silva',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Nome de Guerra',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: nomeDeGuerraController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: Sgt Fulano',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Posto/Graduação',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField<String>(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  initialValue: cargoSelecionado,
                                  hint: const Text(
                                    'Selecione o Posto/Graduação',
                                  ),
                                  isExpanded: true,
                                  items: listaCargos.map((cargo) {
                                    return DropdownMenuItem<String>(
                                      value: cargo,
                                      child: Text(cargo),
                                    );
                                  }).toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      cargoSelecionado = value;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Função',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: funcaoController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: CBU',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Número BM',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value?.length != 7) {
                                      return 'Número BM deve ter 7 digitos';
                                    }
                                    return null;
                                  },
                                  maxLength: 7,
                                  keyboardType: TextInputType.number,
                                  controller: numeroBMController,
                                  decoration: InputDecoration(
                                    hintText: 'Apenas números. Ex: 0000000',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Unidade Pertencente',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  initialValue: unidadeSelecionada,
                                  hint: const Text('Selecione sua unidade'),
                                  items: [
                                    DropdownMenuItem(
                                      value: '4º COB',
                                      child: Text('4º COB'),
                                    ),
                                    DropdownMenuItem(
                                      value: '7º BBM',
                                      child: Text('7º BBM'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      unidadeSelecionada = value;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Cursos',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: ExpansionTile(
                                    title: Text('Selecione os cursos'),
                                    children: [
                                      Material(
                                        child: SingleChildScrollView(
                                          child: SizedBox(
                                            height: 200,
                                            child: ListView.separated(
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) {
                                                return CheckboxListTile(
                                                  title: Text(
                                                    listaCursos[index]
                                                        .nomeCurso,
                                                  ),
                                                  value: listaCursosDoMilitar
                                                      .contains(
                                                        listaCursos[index]
                                                            .nomeCurso,
                                                      ),
                                                  onChanged: (value) async {
                                                    if (value == true) {
                                                      await context
                                                          .read<Storage>()
                                                          .adicionarMilitarCursoLocal(
                                                            MilitarCurso(
                                                              idCurso:
                                                                  listaCursos[index]
                                                                      .idCurso,
                                                              idMilitar:
                                                                  idMilitar,
                                                              deletado: false,
                                                              sincronizado:
                                                                  false,
                                                            ),
                                                          );
                                                      await context
                                                          .read<Storage>()
                                                          .sincronizarMilitarCursoLocalParaNuvem();
                                                      await carregarCursosDosMilitar(
                                                        idMilitar,
                                                      );
                                                      setState(() {});
                                                    } else {
                                                      await context
                                                          .read<Storage>()
                                                          .removerMilitarCursoLocal(
                                                            MilitarCurso(
                                                              idCurso:
                                                                  listaCursos[index]
                                                                      .idCurso,
                                                              idMilitar:
                                                                  idMilitar,
                                                              deletado: true,
                                                              sincronizado:
                                                                  false,
                                                            ),
                                                          );

                                                      await context
                                                          .read<Storage>()
                                                          .sincronizarMilitarCursoLocalParaNuvem();
                                                      await carregarCursosDosMilitar(
                                                        idMilitar,
                                                      );
                                                      setState(() {});
                                                    }
                                                  },
                                                );
                                              },
                                              separatorBuilder:
                                                  (context, index) => Divider(),
                                              itemCount: listaCursos.length,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Categoria Motorista',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  initialValue: habilitacaoSelecionada,
                                  hint: const Text(
                                    'Selecione seu credenciamento',
                                  ),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'a',
                                      child: Text('A'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'b',
                                      child: Text('B'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'ab',
                                      child: Text('AB'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'c',
                                      child: Text('C'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'd',
                                      child: Text('D'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'e',
                                      child: Text('E'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      habilitacaoSelecionada = value;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Naturalidade',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: naturalidadeController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: Belo Horizonte - MG',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Data de Nascimento',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    hint: Text(
                                      'Coloque sua data de nascimento',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  controller: dateController,
                                  onTap: () async {
                                    final dateTime = await showDatePicker(
                                      context: context,
                                      firstDate: DateTime(1900),
                                      lastDate: DateTime.now(),
                                    );
                                    if (dateTime != null) {
                                      dateController.text =
                                          '${dateTime.day}/${dateTime.month}/${dateTime.year}';
                                    }
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Estado Civil',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  initialValue: estadoCivilSelecionado,
                                  hint: const Text('Selecione o estado civil'),
                                  items: [
                                    DropdownMenuItem(
                                      value: 'solteiro',
                                      child: Text('Solteiro'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'casado',
                                      child: Text('Casado'),
                                    ),
                                    DropdownMenuItem(
                                      value: 'viuvo',
                                      child: Text('Viuvo(a)'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      estadoCivilSelecionado = value;
                                    });
                                  },
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Cidade',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: cidadeController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: Montes Claros',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Bairro',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: bairroController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: Alterosa',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Rua',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: ruaController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: Pedro II',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Número',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: numeroController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: 999',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Complemento',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: complementoController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: Casa, Apartamento',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'CEP',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  maxLength: 8,
                                  keyboardType: TextInputType.number,
                                  controller: cepController,
                                  decoration: InputDecoration(
                                    hintText: 'Apenas números, Ex: 39400000',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Telefone',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: telefoneController,
                                  decoration: InputDecoration(
                                    hintText: 'Apenas numeros. Ex: 31999598840',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'CPF',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  maxLength: 11,
                                  validator: (value) {
                                    if (value?.length != 11) {
                                      return 'CPF deve set 11 algarismos';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: cpfController,
                                  decoration: InputDecoration(
                                    hintText:
                                        ' Apenas números. Ex: 00000000000',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Banco da CC',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: bancoController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: Itaú',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Número da CC',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: numeroContaController,
                                  decoration: InputDecoration(
                                    hintText: 'Apenas números. Ex: 00000',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Número Agência',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: numeroAgController,
                                  decoration: InputDecoration(
                                    hintText: ' Ex: 000000-x',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Quantidade ADI',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: quantidadeAdiController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: 3',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Email Contato',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: contatoController,
                                  decoration: InputDecoration(
                                    hintText: 'Ex: fulano@bombeiros.mg.gov.br',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                    0,
                                    16,
                                    0,
                                    8,
                                  ),
                                  child: Text(
                                    'Observação',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: obsController,
                                  decoration: InputDecoration(
                                    hintText: 'Observação',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        await atualizarDados();
                                      },
                                      child: Text('Atualizar Dados'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff9e0f20), Color(0xffe35033)],
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  child: imagePath == null
                      ? CircleAvatar(
                          radius: 75,
                          child: Icon(Icons.person, size: 150),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(75),
                          child: Image.network(
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return SizedBox(
                                height: 150,
                                width: 150,
                                child: CircularProgressIndicator(),
                              );
                            },
                            imagePath!,
                            scale: 1,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ],
            ),
          ),
          if (atualizandoDados) ...[
            ModalBarrier(color: Colors.black26, dismissible: false),
            Center(child: CircularProgressIndicator()),
          ],
        ],
      ),
    );
  }

  String pegarUUIDUsuario() {
    return repository.pegarUUIDUsuario();
  }

  Future<String> pegarIdMilitarUsuario() async {
    final Militar? militar = await context.read<Storage>().pegarDadosUsuario();
    if (militar == null) {
      return '';
    }
    return militar.idMilitar;
  }

  Future<void> atualizarListaCursos() async {
    await context.read<Storage>().atualizarListaCursos();
  }

  Future<void> carregarDadosUsuario() async {
    final militar = await repository.pegarDadosUsuario();

    if (militar == null) return;

    nomeCompletoController.text = militar.nomeCompleto;
    nomeDeGuerraController.text = militar.nomeDeGuerra;
    numeroBMController.text = militar.numeroBM;
    cpfController.text = militar.cpf;
    funcaoController.text = militar.funcao;
    cidadeController.text = militar.cidade;
    bairroController.text = militar.bairro;
    ruaController.text = militar.rua;
    numeroController.text = militar.numeroResidencia;
    bancoController.text = militar.banco;
    numeroContaController.text = militar.numeroConta;
    numeroAgController.text = militar.numeroAg;
    quantidadeAdiController.text = militar.quantidadeAdi;
    telefoneController.text = militar.telefone;
    contatoController.text = militar.email;
    cepController.text = militar.cep;
    naturalidadeController.text = militar.naturalidade;
    complementoController.text = militar.complementoEndereco;
    naturalidadeController.text = militar.naturalidade;
    dateController.text =
        '${militar.dataNascimento.day.toString().padLeft(2, '0')}/'
        '${militar.dataNascimento.month.toString().padLeft(2, '0')}/'
        '${militar.dataNascimento.year}';
    obsController.text = militar.obs;

    if (!mounted) return;

    setState(() {
      cargoSelecionado = militar.cargo.isEmpty ? null : militar.cargo;
      estadoCivilSelecionado = militar.estadoCivil.isEmpty
          ? null
          : militar.estadoCivil;
      unidadeSelecionada = militar.unidadeAtual.isEmpty
          ? null
          : militar.unidadeAtual;
      habilitacaoSelecionada = militar.credencialMotorista.isEmpty
          ? null
          : militar.credencialMotorista;

      listaCursosDoMilitar = [];
    });
  }

  Future<void> carregarCursosDosMilitar(String idMilitar) async {
    listaCursosDoMilitar = await context
        .read<Storage>()
        .pegarListaNomeCursosPorMilitar(idMilitar);
    print('numero cursos do militar: ${listaCursosDoMilitar.length}');
  }

  Future<void> atualizarFotoUsuario() async {
    imagePath = await repository.pegarUrlFotoUsuario();

    if (!mounted) return;

    setState(() {});

    if (imagePath == null) {
      print('Erro ao atualizar foto');
    } else {
      print('Sucesso ao atualizar foto');
    }
  }

  Future<void> salvarFotoBancoDeDados() async {
    final idMilitar = pegarUUIDUsuario();

    final XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (imageFile == null) return;

    final bytes = await imageFile.readAsBytes();

    await repository.fazerUploadImagemUsuario(bytes);
    await repository.salvarUrlFotoUsuarioNoDrift(idMilitar);
    await repository.sincronizarMilitaresComFirebase();
  }

  Future<void> atualizarDados() async {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.warning, color: Colors.orange),
              SizedBox(width: 10),
              Expanded(child: Text('Verifique os campos novamente.')),
            ],
          ),
        ),
      );
      return;
    }
    setState(() {
      atualizandoDados = true;
    });

    final dataNascimento = _converterTextoParaDateTime(dateController.text);

    final militarPerfil = Militar(
      idMilitar: pegarUUIDUsuario(),
      cpf: cpfController.text,
      nomeCompleto: nomeCompletoController.text,
      nomeDeGuerra: nomeDeGuerraController.text,
      numeroBM: numeroBMController.text,
      cargo: cargoSelecionado ?? '',
      credencialMotorista: habilitacaoSelecionada ?? '',
      dataNascimento: dataNascimento,
      estadoCivil: estadoCivilSelecionado ?? '',
      unidadeAtual: unidadeSelecionada ?? '',
      rua: ruaController.text,
      bairro: bairroController.text,
      cidade: cidadeController.text,
      numeroResidencia: numeroController.text,
      cep: cepController.text,
      telefone: telefoneController.text,
      email: contatoController.text,
      naturalidade: naturalidadeController.text,
      urlImagem: imagePath ?? '',
      funcao: funcaoController.text,
      obs: obsController.text,
      sincronizado: false,
      numeroConta: numeroContaController.text,
      banco: bancoController.text,
      numeroAg: numeroAgController.text,
      quantidadeAdi: quantidadeAdiController.text,
      complementoEndereco: complementoController.text,
    );

    Timer? timer;

    try {
      timer = Timer(const Duration(seconds: 5), () {
        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                Icon(Icons.warning, color: Colors.orange),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Serviço com lentidão. Verifique sua conexão com a internet.',
                  ),
                ),
              ],
            ),
          ),
        );
        setState(() {
          atualizandoDados = false;
        });
      });

      await context.read<Storage>().adicionarOuAtualizarMilitarNoDrift(
        militarPerfil,
      );

      await context.read<Storage>().adicionarOuAtualizarDadosUsuarioNaNuvem();

      await context.read<Storage>().sincronizarMilitarCursoLocalParaNuvem();

      // Se terminou antes de 5 segundos, o aviso de lentidão não aparece.
      timer.cancel();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 10),
              Text('Atualização feita com sucesso'),
            ],
          ),
        ),
      );
      setState(() {
        atualizandoDados = false;
      });
    } on Exception catch (e) {
      setState(() {
        atualizandoDados = false;
      });
      timer?.cancel();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.close, color: Colors.red),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Erro na atualização. Verifique sua internet e tente novamente.',
                ),
              ),
            ],
          ),
        ),
      );

      print('Erro ao atualizar: $e');
    }
  }

  DateTime _converterTextoParaDateTime(String texto) {
    final partes = texto.split('/');

    if (partes.length != 3) {
      return DateTime(1900);
    }

    final dia = int.tryParse(partes[0]) ?? 1;
    final mes = int.tryParse(partes[1]) ?? 1;
    final ano = int.tryParse(partes[2]) ?? 1900;

    return DateTime(ano, mes, dia);
  }
}
