import 'package:flutter/material.dart';
import 'package:flutter_socket_io/flutter_socket_io.dart';
import 'package:flutter_socket_io/socket_io_manager.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  _MyHomePageState(){
//    getConnection();
  }


  void getConnection() async {
    SocketIO socketIO = SocketIOManager().createSocketIO("http://10.0.2.2:3000", "/",socketStatusCallback: _socketStatus);
    socketIO.init();
    socketIO.connect();
    socketIO.sendMessage("sex", "{msg:'comming from a flutter socket!'}");
//    socketIO.subscribe(event, callback)

  }

  _socketStatus(dynamic data) {
    print("Socket status: " + data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Socket test app"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: getConnection,
              child: Text("connect"),
            ),
//            StreamBuilder(
//              stream: socket,
//              builder: (context, snapshot) {
//                return Padding(
//                  padding: const EdgeInsets.symmetric(vertical: 24.0),
//                  child: Text(snapshot.hasData
//                      ? '${String.fromCharCodes(snapshot.data)}'
//                      : ''),
//                );
//              },
//            ),
          ],
        )
      ),
    );
  }
}