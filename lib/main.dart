import 'package:flutter/material.dart';

void main() => runApp(
  new MaterialApp(
    home: new MyApp(),
  )
);

class MyApp extends StatefulWidget{
  @override
  MyState createState() => new MyState();

}
class MyState extends State<MyApp>{

  List<bool>_data = new List<bool>();

  @override
  void initState(){
    setState(() {
      for(int i =0; i<100;i++){
        _data.add(false);
      }
    });
  }

  void _onChange(bool value , int index){
    _data[index] = value;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("List View"),
      ),
      body: new ListView.builder(
        itemCount: _data.length,
          itemBuilder: (BuildContext context , int  index ){
          return Card(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Text(("This Is Item {$index}")),
                  new CheckboxListTile(
                      value: _data[index],
                      controlAffinity: ListTileControlAffinity.leading,
                      title: new Text("Click Me"),
                      onChanged: (bool value){
                        _onChange(value, index);
                      })
                ],
              ),
            ),
          );

          }),
    );
  }

}