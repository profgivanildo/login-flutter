import 'package:flutter/material.dart';
import 'package:ola_mundo/app_contreller.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int counter = 0; 

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: ClipOval(
                  child: Image.asset('assets/images/avatar.png'),
                ),
                accountName: Text('Givanildo Gonçalves'),
                accountEmail: Text('givanildo@gmail.com'),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Início'),
                subtitle: Text('Tela inicial do app'),
                onTap: () {
                  print('Clicou em Início!');
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('Logout'),
                subtitle: Text('Sair do app'),
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [CustomSwitch()],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 250,
              child: AppController.instance.isDarkTheme
                  ? Image.asset('assets/images/logo-v-cor-negativo.png')
                  : Image.asset('assets/images/logo-v-cor-positivo.png'),
            ),
            Container(
              height: 50,
            ),
            Center(
              child: Text(
                AppController.instance.isDarkTheme
                    ? 'Este é o tema escuro'
                    : 'Este é o tema claro',
                style: TextStyle(fontSize: 30),
              ),
            ),
            Text('Contador de cliques: $counter',
                style: TextStyle(fontSize: 20, color: Colors.cyan))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              counter++;
            });
          },
        ),
      ),
    );
  }
}

class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme,
      onChanged: (value) {
        AppController.instance.changeTheme();
      },
    );
  }
}
