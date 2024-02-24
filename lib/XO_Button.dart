import 'package:flutter/material.dart';
import 'xoColors.dart';

class xoButton extends StatelessWidget{
  String buttonText;
  int index;
  Function onButtinCliked;
  xoButton({required this.buttonText,required this.onButtinCliked,required this.index});
  @override
  Widget build(BuildContext context) {
   return Expanded(
     child: Container(
       margin: EdgeInsets.all(6),
         padding: EdgeInsets.all(5),
         child: ElevatedButton(
           style:ElevatedButton.styleFrom(backgroundColor: xoColors.SecondaryColor,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
           ),
             onPressed: (){
               onButtinCliked(index);
             },
             child: Text(buttonText,style: TextStyle(
               color: (buttonText =='X')? xoColors.accentColor: Colors.pink,
               fontSize: 37,
             ),)
         )),
   );
  }
}