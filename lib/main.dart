import 'package:flutter/material.dart';

void main() {
  runApp(DenisasApp());
}

class DenisasApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  var _result;
  var _controller=TextEditingController();
  var cursEuro=4.93;
  bool isVisible=false;


  @override
  Widget build(BuildContext context) {

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return MaterialApp(
      home: Scaffold(

        resizeToAvoidBottomInset: true,

        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('Sistem de conversie valută'),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,


        ),
        body: SingleChildScrollView(
            reverse: true,
          physics: ClampingScrollPhysics(),
          child: ConstrainedBox(
            constraints: BoxConstraints(),
            child: Container(
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,



              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(




                mainAxisSize: MainAxisSize.min,


                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Image.network('https://cdn2.vectorstock.com/i/1000x1000/38/66/cute-money-banknote-with-question-vector-25803866.jpg'),
                  Image.network('https://drive.google.com/uc?export=view&id=1Esdb6lB2yaIZ8g1szriPGlwr6eG-i-_T', fit:BoxFit.contain),
                  Padding(
                   // padding: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.only(left: 15, bottom: 2, top: 3, right: 15),
                    child: Text(

                      'Conversie Lei - Euro',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w600,

                      )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextField(
                      scrollPadding: EdgeInsets.all(12.0),
                      controller: _controller,
                      cursorColor: Colors.deepPurple,


                        decoration: new InputDecoration(
                          suffix: IconButton(
                            icon:Icon(Icons.clear),


                            onPressed:(){
                              _controller.clear();
                              setState(() {
                                isVisible= false;
                              });

                            }

                          ),
                            contentPadding:
                            EdgeInsets.only(left: 15, bottom: 11, top: 0, right: 15),
                            hintText: "Tastează suma"),
                      textAlignVertical: TextAlignVertical.center,
                      textAlign: TextAlign.left,

                        keyboardType: TextInputType.number,
                      onChanged: (value){
                        setState(() {
                          if(value.isEmpty){
                            _result=0;
                            isVisible=false;
                          }
                          else {
                            _result = double.parse('$value')/cursEuro;
                            _result=double.parse('$_result').toStringAsFixed(2);
                          }
                        });
                      }
                        ),
                  ),


                  TextButton(

                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.deepPurple),

                          padding:MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 12, horizontal: 50)),




                        ),


                      child: Text('Calculează'),

                      onPressed: ()  {
                        setState(() {
                          isVisible= !isVisible;
                        });

                      }),

                  Visibility(
                    visible: isVisible,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        '$_result €',

                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  ],
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(

          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                context:context,
                builder: (ctxt) => new AlertDialog(
                  title: Text(
                      'Boop!',
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                )
              ));
            },
            tooltip: 'Increment',
            child: Icon(Icons.account_balance),
            backgroundColor: Colors.deepPurple,
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
