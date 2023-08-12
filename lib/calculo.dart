import 'package:flutter/material.dart';

class CalculoScreen extends StatefulWidget {
  @override
  _CalculoScreenState createState() => _CalculoScreenState();
}

class _CalculoScreenState extends State<CalculoScreen> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = '';

  void _calcular() {
    double? precoAlcool = double.tryParse(_controllerAlcool.text);
    double? precoGasolina = double.tryParse(_controllerGasolina.text);
    if (precoAlcool == null || precoGasolina == null) {
      setState(() {
        _textoResultado = 'Número Inválido';
      });
    } else {
      if ((precoAlcool / precoGasolina) >= 0.7) {
        setState(() {
          _textoResultado = 'melhor abastecer com gasolina';
        });
      } else {
        setState(() {
          _textoResultado = 'melhor abastecer com Álcool';
        });
      }
      _limparCampos();
    }
  }

  void _limparCampos() {
    _controllerGasolina.text = '';
    _controllerAlcool.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Cálculo Vale-a-Pena",
              style: TextStyle(fontSize: 24, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Image.asset('assets/posto.jpeg', width: MediaQuery.of(context).size.width * 0.8),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'saiba qual a melhor opção para abastecimento',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Preço Alcool, ex: 4.67'),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  controller: _controllerAlcool,
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Preço Gasolina, ex: 5.89'),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  controller: _controllerGasolina,
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            child: Text('Calcular'),
            onPressed: () {
              _calcular();
            },
          ),
          SizedBox(height: 20),
          Text(
            '$_textoResultado ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CalculoScreen(),
  ));
}

