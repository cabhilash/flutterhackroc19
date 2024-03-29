import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mentor App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Mentor App Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      obscureText: false,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
            return new SecondScreen();
          }));
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
        ),
      ),
    );
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding( padding: const EdgeInsets.all(36.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox( height: 155.0, child: Image.asset("assets/logo.png",fit: BoxFit.contain,),),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),  
                passwordField,
                SizedBox(height: 35.0,),
                loginButon,
                SizedBox(height: 15.0,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final TextEditingController controller = new TextEditingController();
 
  @override
  Widget build(BuildContext context) {
 
  void _showcontent() {
    showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('Questions for mentors'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('We have submitted your question.'),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
    void _goBack()
    {
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Questions - get help'),
      ),
      body: Center(
        child: Container(color:Colors.white ,
        child: Padding( padding: const EdgeInsets.all(12.0),
        child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new RaisedButton(onPressed: _showcontent, color: Colors.redAccent, 
                        child: new Text('Show avialable mentors', style: TextStyle(color: Colors.white)), 
              ),
              SizedBox(height: 65.0),
                new TextField( keyboardType: TextInputType.multiline, maxLines: null,
                decoration: InputDecoration( contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                   hintText: "Ask question to mentor",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))) ,
                    ),
                new RaisedButton(onPressed: _showcontent, color: Colors.blueAccent, 
                        child: new Text('Ask Question', style: TextStyle(color: Colors.white)), 
              ),
              ],
        
        ),
        ),
        ),
      ),
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: _goBack,
        backgroundColor: Colors.red,
        foregroundColor: Colors.black,
      ),
    );
  }
}
