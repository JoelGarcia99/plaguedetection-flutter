import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:dotenv/dotenv.dart' show env;

class SocketConnection {

  static SocketConnection _instance;

  factory SocketConnection(){
    if(_instance == null){
      _instance = new SocketConnection._();
    }

    return _instance;
  }

  SocketConnection._();

  // Stablishing socket connection
  // This will come from a .env file
  IO.Socket _socket = IO.io("http://192.168.0.103:5000/",
    IO.OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .disableAutoConnect()  // disable auto-connection
      .build()
  );

  // Streams to reactive programming
  final StreamController<bool> _activeStream = new StreamController<bool>.broadcast();

  void dispose(){
    // Closing stream broadcasting
    _activeStream?.close();
  }

  void initConnection() {
    this._socket.connect();

    this._socket.onConnectError(print);

    print("Socket initialized");
    this._socket.onConnect((data){
      print(data);
      _activeStream.sink.add(true);
    });

    this._socket.onDisconnect((data){
      print(data);
      _activeStream.sink.add(false);
    });
  }


  // Getters and setters
  /// Here true means active
  Stream<bool> get status => _activeStream.stream;

}