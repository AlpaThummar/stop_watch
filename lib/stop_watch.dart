import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Stop_Watch(),
  ));
}

class Stop_Watch extends StatefulWidget {
  const Stop_Watch({Key? key}) : super(key: key);

  @override
  State<Stop_Watch> createState() => _Stop_WatchState();
}

class _Stop_WatchState extends State<Stop_Watch> {
  int hr = 0, min = 0, second = 0, mins=0, hrs=0;
  bool tamp=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tamp=false;
     }

  Stream time() async* {
    if (tamp) {
      for(int j=0;j<=59;j++) {
        await Future.delayed(Duration(milliseconds: 59));
        second = j;
        if(second==59)
        {
          min=(second/59) as int;
          mins+=min;
          if(mins==59)
          {
            hr=(mins/59) as int;
            hrs+=hr;
          }
          j=0;
        }
        yield second;
      }
    }

    print("Second:${second}");

  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: StreamBuilder(
              stream: (tamp==true)?time():null,
              builder: (context, snapshot) {
                print(snapshot.data);
                print(snapshot.connectionState);

              return Container(
                    child: Text(
                      "${hrs}:${mins}:${second}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 50),
                    ),
                  );

             },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            alignment: Alignment.center,
            height: 350,
            width: 300,
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
                color: Colors.white70),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                 if(tamp==false)
                   { tamp=true;}else{tamp=false;}
                 setState(() {});
                },
                child: Container(
                  height: 30,
                  width: 100,
                  child: Center(
                    child: Text(
                      "Start",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                ),
              ),
              InkWell(onTap: () {
                  tamp=false;
                  setState(() {

                  });
              },
                child: Container(
                  height: 30,
                  width: 100,
                  child: Center(
                    child: Text(
                      "Stop",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                ),
              ),
              InkWell(onTap: () {
                second==0;
                mins==0;
                hr=0;
                tamp=false;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                  return Stop_Watch();
                },));
                setState(() {

                });
              },
                child: Container(
                  height: 30,
                  width: 100,
                  child: Center(
                    child: Text(
                      "Reset",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
