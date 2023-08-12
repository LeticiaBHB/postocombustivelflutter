import 'package:flutter/material.dart';

class ConvenienciaScreen extends StatefulWidget {
  const ConvenienciaScreen({Key? key}) : super(key: key);

  @override
  _ConvenienciaScreenState createState() => _ConvenienciaScreenState();
}

class _ConvenienciaScreenState extends State<ConvenienciaScreen> {
  bool _trocadeoleo = false;
  bool _alinhamentoEBalanceamento = false;
  bool _trocedefiltro = false;
  bool _revisaofreios = false;
  String? _escolhaUsuario;
  bool _notificacao = false;
  double valor = 5;
  String label = '5';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conveniência'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CheckboxListTile(
                title: Text("Troca de Óleo"),
                subtitle: Text('na mecânica do posto'),
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
                value: _trocedefiltro,
                onChanged: (bool? valor) {
                  setState(() {
                    _trocedefiltro = valor!;
                  });
                },
              ),
              CheckboxListTile(
                title: Text("Revisão de Freios"),
                subtitle: Text('na mecânica do posto'),
                activeColor: Colors.redAccent,
                secondary: Icon(Icons.cabin_outlined),
                value: _revisaofreios,
                onChanged: (bool? valor) {
                  setState(() {
                    _revisaofreios = valor!;
                  });
                },
              ),
              SizedBox(height: 16),
              Text('Em qual posto?', textAlign: TextAlign.center),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('EcoDrive Fuels'),
                  Radio(
                    value: 'EcoDrive Fuels',
                    groupValue: _escolhaUsuario,
                    onChanged: (String? escolha) {
                      setState(() {
                        _escolhaUsuario = escolha!;
                      });
                      print('resultado' + escolha!);
                    },
                  ),
                  Text('VelocityVista Gas'),
                  Radio(
                    value: 'VelocityVista Gas',
                    groupValue: _escolhaUsuario,
                    onChanged: (String? escolha) {
                      setState(() {
                        _escolhaUsuario = escolha!;
                      });
                      print('resultado' + escolha!);
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Switch(
                    value: _notificacao,
                    onChanged: (bool valor) {
                      setState(() {
                        _notificacao = valor;
                      });
                    },
                  ),
                  Text('Receber notificações?'),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Salvar',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 100),
              Column(
                children: [
                  Text('Quanto você está satisfeito com nosso aplicativo?'),
                  SizedBox(height: 16),
                  Slider(
                    value: valor,
                    min: 0,
                    max: 10,
                    label: label,
                    divisions: 10,
                    activeColor: Colors.redAccent,
                    inactiveColor: Colors.black26,
                    onChanged: (double novoValor) {
                      setState(() {
                        valor = novoValor;
                        label = novoValor.toString();
                      });
                    },
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      print('valor selecionado:' + valor.toString());
                    },
                    child: Text(
                      'Enviar',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ConvenienciaScreen(),
  ));
}

