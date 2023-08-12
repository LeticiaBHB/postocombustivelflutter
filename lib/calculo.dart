import 'package:flutter/material.dart';

class CalculoScreen extends StatefulWidget {
  @override
  _CalculoScreenState createState() => _CalculoScreenState();
}

class _CalculoScreenState extends State<CalculoScreen> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = '';

  void _calcular(){
   double? precoAlcool = double.tryParse(_controllerAlcool.text);
   double? precoGasolina = double.tryParse(_controllerGasolina.text);
  if(precoAlcool == null || precoGasolina == null){
    setState((){
      _textoResultado = 'Número Inválido';
    });

  }else{
   if ((precoAlcool / precoGasolina) >= 0.7){
     setState((){
       _textoResultado = 'melhor abastecer com gasolina';
     });
   } else {
     setState((){
       _textoResultado = 'melhor abastecer com Álcool';
     });
   }
   _limparCampos();
  }
  }
  void _limparCampos(){
    _controllerGasolina.text = '';
    _controllerAlcool.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            width: 250,
            padding: EdgeInsets.all(16.0),
                  child: Text(
              "Cálculo Vale-a-Pena",
              style: TextStyle(fontSize: 24, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Image.asset('assets/posto.jpeg', width: 500, height: 250),
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
            margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Preço Alcool, ex: 4.67'),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: 'Preço Gasolina, ex: 5.89'),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  controller: _controllerGasolina,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: ElevatedButton(
              child: Text('Calcular'),
              onPressed: () {_calcular();},
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top:20),
            child: Text ('$_textoResultado ',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
            ),
          ),
        ],
      ),
    );
  }
}

