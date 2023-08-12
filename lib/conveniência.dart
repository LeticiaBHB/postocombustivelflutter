import 'package:flutter/material.dart';

class ConvenienciaScreen extends StatefulWidget {
  const ConvenienciaScreen({Key? key}) : super(key: key);

  @override
  _ConvenienciaScreenState createState() => _ConvenienciaScreenState();
}

class _ConvenienciaScreenState extends State<ConvenienciaScreen> {
  bool _trocadeoleo = false;
  bool _alinhamentoEBalanceamento = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Column(
              children: <Widget>[
                CheckboxListTile(
                  title: Text("Troca de Óleo"),
                  subtitle: Text('o melhor da região'),
                  activeColor: Colors.redAccent,
                  secondary: Icon(Icons.cabin_outlined),
                  value: _trocadeoleo,
                  onChanged: (bool? valor) {
                    setState(() {
                      _trocadeoleo = valor!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Alinhamento e Balanceamento"),
                  subtitle: Text('na mecânica do posto'),
                  activeColor: Colors.redAccent,
                  secondary: Icon(Icons.cabin_outlined),
                  value: _alinhamentoEBalanceamento,
                  onChanged: (bool? valor) {
                    setState(() {
                      _alinhamentoEBalanceamento = valor!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Troca de Filtros"),
                  subtitle: Text('na mecânica do posto'),
                  activeColor: Colors.redAccent,
                  secondary: Icon(Icons.cabin_outlined),
                  value: _alinhamentoEBalanceamento,
                  onChanged: (bool? valor) {
                    setState(() {
                      _alinhamentoEBalanceamento = valor!;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text("Revisão de Freios"),
                  subtitle: Text('na mecânica do posto'),
                  activeColor: Colors.redAccent,
                  secondary: Icon(Icons.cabin_outlined),
                  value: _alinhamentoEBalanceamento,
                  onChanged: (bool? valor) {
                    setState(() {
                      _alinhamentoEBalanceamento = valor!;
                    });
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Coloque o código para salvar aqui
                  },
                  child: Text(
                    'Salvar',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
          Container(

          ),
        ],
      ),
    );
  }
}
