import 'package:flutter/material.dart';

import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';

const _tituloAppBar = 'Criar Transferência';
const _rotuloNumeroConta = 'Número da conta';
const _dicaNumeroConta = '0000';

const _rotuloValor = 'Valor';
const _dicaValor = '00.00';

class FormularioTransferencia extends StatefulWidget {
  
  const FormularioTransferencia({super.key});

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _numeroController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
                controller: _numeroController,
                labelText: _rotuloNumeroConta,
                hintText: _dicaNumeroConta),
            Editor(
                controller: _valorController,
                labelText: _rotuloValor,
                hintText: _dicaValor,
                icon: Icons.monetization_on),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => _onPressed(context),
                child: const Text('Confirmar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onPressed(BuildContext context) {
    final int? numeroConta = int.tryParse(_numeroController.text);
    final double? valorConta = double.tryParse(_valorController.text);

    if (valorConta != null && numeroConta != null) {
      final Transferencia transferencia =
          Transferencia(valorConta, numeroConta);
      Navigator.pop(context, transferencia);
    }
  }
}