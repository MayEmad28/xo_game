import 'package:flutter/material.dart';
import 'xoColors.dart';
import 'Xo.dart';
class playerScreen extends StatelessWidget {
  String player1='';
   String player2='';
  static const routeName='playerScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,),
      backgroundColor: xoColors.primaryColor,
      body: Column(
        children: [
          Container(
            height: 200,
            width: 100,
            child:Icon(Icons.videogame_asset_outlined,color: xoColors.accentColor,size: 120,),
    ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (text){
                      player1=text;
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: xoColors.accentColor)),
                      labelText: 'Player1 Name',
                      labelStyle: TextStyle(color: Colors.white)

                    ),
                  ),
                  SizedBox(height: 35,),
                  TextField(
                    style: TextStyle(color: Colors.white),
                    onChanged: (text){
                      player2=text;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: xoColors.accentColor)),
                      labelText: 'Player2 Name', labelStyle: TextStyle(color: Colors.white)
                    ),
                  ),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: xoColors.SecondaryColor),
                      onPressed: (){
                    Navigator.of(context).pushNamed(XO.routeName,
                        arguments:playerScreenArgs(player1Name: player1, player2Name: player2)
                    );
                  }, child: Text('Start'))
                ],
            ),
             ),
        ],
      ),
    );
  }
}

