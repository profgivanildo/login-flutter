
import 'package:flutter/material.dart';
import 'package:ola_mundo/app_contreller.dart';
import 'package:ola_mundo/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String pass = '';

  Widget _bodyLogin() {
    return SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                child: Image.asset('assets/images/logo-v-cor-positivo.png'),
              ),
              Container(height: 40),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    onChanged: (text) {
                      email = text;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                    onChanged: (text) {
                      pass = text;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Container(height: 10),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  height: 50,
                  child: RaisedButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    onPressed: () {
                      if (email == 'admin@admin.com' && pass == '123') {
                        Navigator.of(context).pushReplacementNamed('/home');
                        //Exemplo de rota manual
                        /* Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => HomePage()),
                          ); */
                      } else {
                        print('Login inválido');
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      child: Text(
                        'Logar',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            'assets/images/background.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
        ),
        _bodyLogin(),
      ],
    ));
  }
}
