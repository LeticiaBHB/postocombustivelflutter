import 'package:flutter/material.dart';
import 'calculo.dart';
import 'conveniência.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home', // Rota inicial
      routes: {
        '/home': (context) => HomeScreen(),
        '/calculo': (context) => CalculoScreen(),
        '/conveniencia': (context) => ConvenienciaScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _indiceAtual = 0;
  final List<Widget> _telas = [
    NewPageScreen(
      Image.asset('logo.jpeg', width: 500, height: 500,),
    ),
    CalculoScreen(),
    ConvenienciaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posto de Combustíveis'),
      ),
      body: _telas[_indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_business_rounded),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: "Comparação",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: "Serviços",
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _indiceAtual = index;
    });
  }
}

class NewPageScreen extends StatelessWidget {
  final Widget conteudo;

  NewPageScreen(this.conteudo);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: conteudo,
      ),
    );
  }
}
