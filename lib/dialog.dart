import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'xoColors.dart';

class dialogC extends StatelessWidget{
  String winnerName;
  dialogC({required this.winnerName});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: xoColors.accentColor,
      child: Container(
        decoration: BoxDecoration(borderRadius:BorderRadius.circular(100),
         ),
        height: 200,
        child:Column(
          children: [
            Icon(Icons.emoji_events,color: xoColors.SecondaryColor,size: 60,),
            SizedBox(height: 7,),
            Text('${winnerName.toUpperCase()} Won!',style: TextStyle(fontSize: 20),),
            SizedBox(height: 37,),
            ElevatedButton(onPressed: (){Navigator.pop(context);},
                style: ElevatedButton.styleFrom(backgroundColor: xoColors.SecondaryColor),
                child: Text('Okay'))
          ],
        ),
      ),
    );
  }

}
