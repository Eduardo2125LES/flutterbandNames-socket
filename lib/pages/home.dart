

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_avanced/models/band.dart';

class HomePage  extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bands> band = [
    Bands( id:"1", name:"Imagine Dragons", votes: 9 ),
    Bands( id:"2", name:"Codplay", votes: 9 ),
    Bands( id:"3", name:"Maroon 5", votes: 5 ),
    Bands( id:"4", name:"21 pilots", votes: 8 ),
    Bands( id:"5", name:"Bruno Marz", votes: 6 ),
    Bands( id:"6", name:"katy perry", votes: 4 ),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nombre de Bandas", style: TextStyle(
          color: Colors.black
        ), ),
        backgroundColor: Colors.white,
      ),
        body: ListView.builder(
          itemCount: band.length,
          itemBuilder: ( context,  i) =>
              _nameBands(band[i])
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addNewBand,
      ),
    );
}

  Widget _nameBands(Bands band) {
   return Dismissible(
     onDismissed: (direction ){
       print('direction: ${direction}');
       print('id: ${band.id}');

     },
     background: Container(
       padding: EdgeInsets.only(left: 8.0),
       color: Colors.red,
       child: Align(
         alignment: Alignment.centerLeft,
         child: Text('Delete Band',style: TextStyle(color: Colors.white),),
       ),
     ),
     direction: DismissDirection.startToEnd,
     key: Key(band.id),
     child: ListTile(
        leading: CircleAvatar(
          child: Text(band.name.substring(0,2), style: TextStyle(fontWeight:FontWeight.bold ),),
          backgroundColor: Colors.blue,
        ),
       title: Text(band.name),
       trailing: Text("${band.votes}", style: TextStyle(fontSize: 15),),
       onTap: (){
          print(band.name);
       },
      ),
   );
  }

  addNewBand(){
    final textController = new TextEditingController();
    return showDialog(context: context,
        builder:(context){
      return AlertDialog(
        title: Text("agregar banda"),
        content: TextField(
          controller: textController,
        ),
        actions: [
          MaterialButton(
            onPressed: ()=> addBandToList(textController.text),
            child: Text('add', ),
            elevation: 4,
            textColor: Colors.blue,

          )
        ],


      );

        });
  }


  void addBandToList ( String name){

    if (name.length > 1){
      //agregar
      this.band.add(new Bands(id:DateTime.now().toString() , name: name, votes:5 ));
      setState(() {

      });
    }
    Navigator.pop(context);

  }
}
