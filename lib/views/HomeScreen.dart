import 'package:deteccionplagas/socket/SocketConnection.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final socketConnection = new SocketConnection();

  @override
  Widget build(BuildContext context) {

    // Initializing the connection with server
    socketConnection.initConnection();

    return SafeArea(
      child: Scaffold(
        body: StreamBuilder(
          stream: socketConnection.status,
          initialData: false,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot){
            return Center(
              child: Container(
                child: Text(snapshot.data? "Conectado":"Desconectado"),
              ),
            );
          },
        ),
      ),
    );
  }
}