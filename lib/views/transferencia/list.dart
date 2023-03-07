import 'package:flutter/material.dart';

import 'package:bytebank/models/transferencia.dart';
import 'add.dart';

const _tituloAppBar = 'Transferências';

class ListaTransferencia extends StatefulWidget {
  final List<Transferencia> _transferencias = List.empty(growable: true);

  ListaTransferencia({super.key});

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text(_tituloAppBar)),
        body: ListView.builder(
            itemCount: widget._transferencias.length, itemBuilder: _atualizar),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            _onPressed(context);
          },
        ));
  }

  Widget? _atualizar(context, index) {
    final Transferencia transferencia = widget._transferencias[index];
    return ItemTransferencia(transferencia);
  }

  _onPressed(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const FormularioTransferencia();
    })).then((value) {
      if (value != null && value is Transferencia) {
        final Transferencia cast = value;
        setState(() {
          widget._transferencias.add(cast);
        });
      }
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const ItemTransferencia(this._transferencia, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}
