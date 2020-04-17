import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

const String _name = "Gary Wong";
double estFibonacci = 0;

// void main() => runApp(MyApp());
// void main() => runApp(new FriendlychatApp());
void main() => runApp(new FibonacciCalcApp());

// ====================================== New one | Start ======================================
class FibonacciCalcApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Simple Fibonacci Calculator',
      home: new FibonacciCalcScreen(),
    );
  }
}

class FibonacciCalcScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new FibonacciCalcScreenState();
}

class FibonacciCalcScreenState extends State<FibonacciCalcScreen> {
  int fib = 0;
  int product = 0;

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  int elapsedSec = 0;
  String _elapsedSecString = "abc"; // TODO gw: why it doesn't work??
  String _timeString;

  @override
  void initState() {
    _timeString = _formatDateTime(DateTime.now());
    _elapsedSecString = formatDuration(0);
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    Timer.periodic(Duration(seconds: 1), (Timer t) => increaseElapsedTime());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Simple Fibonacci Calculator")),
      body: new Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Container(
            margin: EdgeInsets.all(10.0),
            //decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: new Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildRowCellContext(6, 'Multiplier:'),
                Expanded(
                  flex: 4,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter a integer',
                      hintStyle: TextStyle(fontSize: 15),
                    ),
                    style: TextStyle(fontSize: 25),
                    keyboardType: TextInputType.number,
                    controller: myController,
                  ),
                ),
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.all(10.0),
            //decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: new Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildRowCellContext(6, 'Elapsed Time:'),
                _buildRowCellContext(4, _elapsedSecString.toString()),
                /*Expanded(
                  flex: 4,
                  child: Text(_elapsedSecString.toString(), style: TextStyle(fontSize: 25)),
                ),*/
              ],
            ),
          ),

          new Container(
            margin: EdgeInsets.all(10.0),
            //decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: new Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildRowCellContext(6, 'Placed Total:'),
                _buildRowCellContext(4, FibonacciCalculationUtil.accumulateTotalProduct().toString()),
                /*
                Expanded(
                  flex: 4,
                  child: Text(FibonacciCalculationUtil.accumulateTotalProduct().toString(), style: TextStyle(fontSize: 25)),
                ),*/
              ],
            ),
          ),



          new Divider(height: 2.0),
          new Container(
            margin: EdgeInsets.all(10.0),
            //decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: new Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildRowCellContext(6, 'Current Step:'),
                _buildRowCellContext(4, FibonacciCalculationUtil.step.toString()),
                /*Expanded(flex: 4, child: Text(FibonacciCalculationUtil.step.toString(), style: TextStyle(fontSize: 25))),*/
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildRowCellContext(6, 'Fibonacci Num:'),
                _buildRowCellContext(4, fib.toString()),
                /*Expanded(flex: 4, child: Text(fib.toString(), style: TextStyle(fontSize: 25))),*/
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildRowCellContext(6, 'Amount to place:'),
                _buildRowCellContext(4, product.toString()),
                /*
                Expanded(
                    flex: 4,
                    child: Text((product).toString(), style: TextStyle(fontSize: 25))),*/
              ],
            ),
          ),
          new Container(
            margin: EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                new IconButton(
                    icon: new Icon(Icons.remove_circle_outline, size: 50.0, color: Colors.blueAccent),
                    onPressed: () {
                      setState(() {
                        FibonacciCalculationUtil.pop();
                        fib = FibonacciCalculationUtil.decreaseAndGet();
                        product = fib * (int.tryParse(myController.text) ?? 0);
                      });
                    }),
                new IconButton(
                    icon: new Icon(
                      Icons.add_circle,
                      size: 50.0,
                      color: Colors.redAccent,
                    ),
                    onPressed: () {
                      setState(() {
                        FibonacciCalculationUtil.push(product);
                        fib = FibonacciCalculationUtil.increaseAndGet();
                        product = fib * (int.tryParse(myController.text) ?? 0);
                      });
                    }),
              ],
            ),
          ),
          new Container(
            //margin: EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(flex: 1, child: Text(""), ),
                Expanded(
                  flex: 8,
                  child: new RaisedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 6,
                            child: new Align(
                                alignment: Alignment.centerRight, child: Text("Reset Timer", style: TextStyle(fontSize: 15))),
                          ),
                          Expanded(
                            flex: 4,
                            child: new Align(
                              alignment: Alignment.centerLeft,
                              child: Icon(Icons.av_timer),
                            ),
                          ),
                        ],
                      ),
                      color: Colors.amberAccent,
                      onPressed: () {
                        _resetElapsedTime();
                      }),
                ),
                Expanded(flex: 1, child: Text(""), ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
  }

  void _getTime() {

    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  void increaseElapsedTime() {
    elapsedSec = elapsedSec + 1;
    final String formattedElapsedSecString = formatDuration(elapsedSec);
    setState(() {
      _elapsedSecString = formattedElapsedSecString;
    });
  }

  void _resetElapsedTime() {
    setState(() {
      elapsedSec = 0;
      _elapsedSecString = formatDuration(elapsedSec);
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return DateFormat('MM/dd/yyyy hh:mm:ss').format(dateTime);
  }

  String formatDuration(int elapsedSec) {

    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    final now = Duration(seconds: elapsedSec);
    final String result = twoDigits(now.inHours.remainder(60)) +
        "h " +
        twoDigits(now.inMinutes.remainder(60)) +
        "m " +
        twoDigits(now.inSeconds.remainder(60)) +
        "s";

    return result;
  }

  Widget _buildRowCellContext(int flex, String label) {
    return new Expanded(
      flex: flex,
      child: Text(
        label,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}


class FibonacciCalculationUtil {

  static var _accumulatedProducts = new List<int>();
  static int _fib = 2; // Starting number suitable for calculation
  static int step = 0;

  static increase() {
    step++;
    if (step > 3) _fib = ((1 + sqrt(5)) / 2 * _fib).round();
  }

  static decrease() {
    if (step == 0) return; // We don't accept the index smaller than 0;

    step--;
    if (step > 3)
      _fib = (_fib / ((1 + sqrt(5)) / 2)).round();
    else
      _fib = 2;
  }

  static int increaseAndGet() {
    increase();

    if (step == 0) return step;
    if (step == 1 || step == 2) return 1;
    if (step == 3) return 2;

    return _fib;
  }

  static decreaseAndGet() {
    decrease();

    if (step == 0) return step;
    if (step == 1 || step == 2) return 1;
    if (step == 3) return 2;

    return _fib;
  }

  static push(int product){
    _accumulatedProducts.add(product);
  }

  static pop(){
    if (_accumulatedProducts.isNotEmpty)
      _accumulatedProducts.removeLast();
  }

  static int accumulateTotalProduct(){
    return _accumulatedProducts.fold(0, (curr, next) => curr + next);
  }
}
// ====================================== New one |  End ======================================

class FriendlychatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Friendlychat',
      home: new ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  dynamic curFibonacci = 2;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Friendlychat")),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Divider(height: 1.0),
          new Container(
            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer(),
          ),
        ],
      ),
      //body: _buildTextComposer(),
    );
  }

  @override
  void dispose() {
    for (ChatMessage message in _messages) message.animationController.dispose();
    super.dispose();
  }

  Widget _buildTextComposer() {
    return new IconTheme(
      data: new IconThemeData(color: Theme.of(context).accentColor),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          //new
          children: <Widget>[
            //new
            new Flexible(
              child: new TextField(
                controller: _textController,
                onSubmitted: _handleSubmitted,
                decoration: new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),

            new Container(
              margin: new EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(icon: new Icon(Icons.send), onPressed: () => _handleSubmitted(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _handleSubmitted(String text) {
    _textController.clear();

    //curFibonacci = num.parse((( 1 + sqrt(curFibonacci) / 2 ) * curFibonacci).toStringAsFixed(0));
    /*var g = new FibonacciCalculationUtil();
    g.increaseAndGet();*/

    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 700),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});

  final String text;
  final AnimationController animationController;

  var g = new FibonacciCalculationUtil();
  String num = FibonacciCalculationUtil.increaseAndGet().toString();

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      axisAlignment: 0.0,
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              margin: const EdgeInsets.only(right: 16.0),
              child: new CircleAvatar(child: new Text(_name[0])),
            ),
            new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(_name, style: Theme.of(context).textTheme.subhead),
                new Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: new Text(text + " " + num.toString()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
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
        primarySwatch: Colors.blue,
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
