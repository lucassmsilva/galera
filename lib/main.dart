import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:galera/router_generator.dart';
import 'package:galera/widgets/topview.dart';

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
  List<String> mydata = [
    'Júnior Chaves Mendes',
    'Nicolas Peres dos Santos',
    'Samuel Chagas de Ávila',
    'Nelson Cunha Henriques',
    'Erasmo Paz Vieira',
    'Michel Antunes Fagundes',
    'Tadeu Watanabe Vila',
    'Felipe Albuquerque Farias',
    'Roberto Soares Pereira',
    'Alessandro Fagundes Garcia',
    'Júnior Chaves Mendes',
    'Nicolas Peres dos Santos',
    'Samuel Chagas de Ávila',
    'Nelson Cunha Henriques',
    'Erasmo Paz Vieira',
    'Michel Antunes Fagundes',
    'Tadeu Watanabe Vila',
    'Felipe Albuquerque Farias',
    'Roberto Soares Pereira',
    'Alessandro Fagundes Garcia',
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
          )),
      body: Column(
        children: <Widget>[
          HeaderContainer(),
          Expanded(
            child: ListView.builder(
              itemCount: mydata.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text(mydata[index]),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
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
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                  hintText: 'Enter valid mail id as abc@gmail.com'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your secure password'),
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
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 130,
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
