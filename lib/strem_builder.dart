import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: future_bulider(),
  ));
}

class future_bulider extends StatefulWidget {
  const future_bulider({Key? key}) : super(key: key);

  @override
  State<future_bulider> createState() => _future_buliderState();
}

class _future_buliderState extends State<future_bulider> {
  int a = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Stream get() async* {
    for(int i=0;i<10;i++)
      {
        await Future.delayed(Duration(seconds: 1));
        a=i;
        yield a;
      }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Steam Builder"),
      ),
      body: StreamBuilder(
        stream: get(),
        builder: (context, snapshot) {
          print(snapshot.data);
          print(snapshot.connectionState);

          if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: 100,
              width: 100,
              //color: Colors.red,
              child: Text(
                "${a}",
                style: TextStyle(fontSize: 30),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
