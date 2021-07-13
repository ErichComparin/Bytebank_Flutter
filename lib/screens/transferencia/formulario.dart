import 'package:al1_bytebank/components/editor.dart';
import 'package:al1_bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';

const _rotuloCampoValor ='Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _textoBotao = 'Confirmar';

const _mensagemErro = 'Valores inválidos!';

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => FormularioTransferenciaState();
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              _controladorCampoValor,
              _rotuloCampoValor,
              _dicaCampoValor,
            ),
            Editor(
              _controladorCampoNumeroConta,
              _rotuloCampoNumeroConta,
              _dicaCampoNumeroConta,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: Text(_textoBotao),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);

    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_mensagemErro),
        ),
      );
    }
  }
}