import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galera/router_generator.dart';
import 'package:galera/widgets.dart';
import 'package:galera/candidatos.dart';
import 'package:signature/signature.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF193283),
      statusBarColor: Color(0xFF193283),
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xFF193283);
    const AccentColor = const Color(0XFF67CDAE);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: PrimaryColor,
        accentColor: AccentColor,
        accentColorBrightness: Brightness.dark,
        buttonTheme: ButtonThemeData(
          buttonColor: AccentColor,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.accent,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: AccentColor,
          ),
        ),
      ),
      initialRoute: '/splash',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 3)).then((_) {
      Navigator.pushNamed(context, '/loginpage');
    });
  }

  final mycolor = const Color(0xFF193283);
  @override
  Widget build(BuildContext context) {
    return Container(
        color: mycolor,
        child: Center(
          child: Container(
            width: 150,
            height: 150,
            child: Image.asset("assets/logo.png"),
          ),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  final List<String> myenterviews = [
    'Grupo X',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/galera.png',
          fit: BoxFit.contain,
          height: 55,
        ),
      ),
      body: Column(
        children: <Widget>[
          SearchContainer(
            img_src: 'assets/home.jpg',
            input_search: 'Pesquisar Grupos',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: myenterviews.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  shadowColor: Theme.of(context).primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(myenterviews[index]),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.pushNamed(context, '/mycandidates');
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

GlobalKey<FormState> formkey = GlobalKey<FormState>();

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/galera.png',
            fit: BoxFit.contain,
            height: 55,
          )),
      body: Column(
        children: <Widget>[
          Container(
            height: 150.0,
            width: 190.0,
            padding: EdgeInsets.only(top: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
            ),
            child: Center(
              child: Image.asset('assets/logo.png'),
            ),
          ),
          Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'User Name',
                        hintText: 'Enter valid mail id as abc@gmail.com',
                        errorStyle: TextStyle(fontSize: 9, height: 0.3),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Padding(
                    padding: EdgeInsets.all(4),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: 'Enter your secure password',
                        errorStyle: TextStyle(fontSize: 9, height: 0.3),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '* Required';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    //TODO FORGOT PASSWORD SCREEN GOES HERE
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.blue, fontSize: 15),
                  ),
                ),
                Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () {
                      if (formkey.currentState.validate()) {
                        Navigator.pushNamed(context, '/');
                      }
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 80,
          ),
          FlatButton(
            onPressed: () {},
            child: Text('New User? Create Account'),
          )
        ],
      ),
    );
  }
}

class MyCandidates extends StatefulWidget {
  @override
  _MyCandidatesState createState() => _MyCandidatesState();
}

class _MyCandidatesState extends State<MyCandidates> {
  final List<Candidatos> mydata = [
    new Candidatos('Júnior Chaves Mendes'),
    new Candidatos('Nicolas Peres dos Santos'),
    new Candidatos('Samuel Chagas de Ávila'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/galera.png',
          fit: BoxFit.contain,
          height: 55,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.edit),
            label: 'Editar Faltas',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.add_box),
            label: 'Novo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send_rounded),
            label: 'Finalizar',
          ),
        ],
      ),
      body: Column(
        children: [
          SearchContainer(
            img_src: 'assets/candidatos.jpg',
            input_search: 'Pesquisar Candidatos',
          ),
          Expanded(
            child: CandidatesList(mydata: mydata),
          ),
        ],
      ),
    );
  }
}

class CandidatesList extends StatefulWidget {
  const CandidatesList({
    Key key,
    @required this.mydata,
  }) : super(key: key);

  final List<Candidatos> mydata;

  @override
  _CandidatesListState createState() => _CandidatesListState();
}

class _CandidatesListState extends State<CandidatesList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.mydata.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/enterview',
                        arguments: widget.mydata[index].nome.toString());
                  },
                  child: Text(widget.mydata[index].nome),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signature',
                        arguments: widget.mydata[index].controller);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MySignature extends StatefulWidget {
  final SignatureController controller;
  MySignature({Key key, this.controller}) : super(key: key);
  @override
  _MySignatureState createState() => _MySignatureState();
}

class _MySignatureState extends State<MySignature> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/galera.png',
          fit: BoxFit.contain,
          height: 55,
        ),
      ),
      body: Column(
        children: [
          ImageBackground(
            img_src: 'assets/assinatura.png',
            divisor: 4,
          ),
          Text(
            'Assinatura',
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(height: 20),
          Stack(alignment: Alignment.center, children: <Widget>[
            Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Signature(
                  controller: widget.controller,
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  backgroundColor: Colors.transparent,
                )),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                onPressed: () {
                  widget.controller.clear();
                },
                icon: Icon(Icons.delete),
                iconSize: 30,
              ),
            ),
          ]),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 50,
            width: 250,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(20)),
            child: FlatButton(
              onPressed: () async {
                if (widget.controller.isNotEmpty) {
                  var data = await widget.controller.toPngBytes();

                  Navigator.pop(context, data);
                }
                ;
              },
              child: Text(
                'Confirmar',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyEnterview extends StatefulWidget {
  final String data;

  const MyEnterview({Key key, this.data}) : super(key: key);
  @override
  _MyEnterviewState createState() => _MyEnterviewState();
}

class _MyEnterviewState extends State<MyEnterview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/galera.png',
          fit: BoxFit.contain,
          height: 55,
        ),
      ),
      body: Column(
        children: [
          ImageBackground(
            img_src: 'assets/entrevista.jpg',
            divisor: 5,
          ),
          Text(
            'Entrevista',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            widget.data,
            style: TextStyle(fontSize: 12),
          ),
          Text('Lista de Faltas'),
        ],
      ),
    );
  }
}
