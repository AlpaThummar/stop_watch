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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future get() async {
    String str;
    await Future.delayed(Duration(seconds: 3));
    str = "Hello";
    return str;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Bildur"),
      ),
      body: FutureBuilder(
        future: get(),
        builder: (context, snapshot) {
          print(snapshot.data);
          print(snapshot.connectionState);
          print(snapshot.stackTrace);

          if (snapshot.connectionState==ConnectionState.done) {
            return Container(
              height: 100,
              width: 100,
              //color: Colors.red,
              child: Text(
                "${snapshot.data}",
                style: TextStyle(fontSize: 30),
              ),
            );

          }else{
            return Center(child: CircularProgressIndicator(),);
          }

        },
      ),
    );
  }
}
