import 'package:flutter/material.dart';
import 'xoColors.dart';
import 'XO_Button.dart';
import 'dialog.dart';

class XO extends StatefulWidget{
  static const routeName='XO';

  @override
  State<XO> createState() => _XOState();
}

class _XOState extends State<XO> {
  List<String> board=[
    '','','',
    '','','',
    '','','',
  ];
  int player1Score=0;
  int player2Score=0;
  late playerScreenArgs args;
  @override
  Widget build(BuildContext context) {
   args =ModalRoute.of(context)?.settings.arguments as playerScreenArgs;
    return Scaffold(
      backgroundColor: xoColors.primaryColor,
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${args.player1Name.toUpperCase()} (X)',style: TextStyle(fontSize: 22,color: Colors.white),),

                    Text('$player1Score',style: TextStyle(fontSize: 22,color: Colors.white),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${args.player2Name.toUpperCase()} (O)',style: TextStyle(fontSize: 22,color: Colors.white),),
                    Text('$player2Score',style: TextStyle(fontSize: 22,color: Colors.white),),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
              xoButton(buttonText: board[0],index: 0,onButtinCliked: onButtonClicked),
              xoButton(buttonText: board[1],index: 1,onButtinCliked: onButtonClicked),
              xoButton(buttonText: board[2],index: 2,onButtinCliked: onButtonClicked),
            ],),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                xoButton(buttonText: board[3],index: 3,onButtinCliked: onButtonClicked),
                xoButton(buttonText: board[4],index: 4,onButtinCliked: onButtonClicked),
                xoButton(buttonText: board[5],index: 5,onButtinCliked: onButtonClicked),
            ],),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                xoButton(buttonText: board[6],index: 6,onButtinCliked: onButtonClicked),
                xoButton(buttonText: board[7],index: 7,onButtinCliked: onButtonClicked),
                xoButton(buttonText: board[8],index: 8,onButtinCliked: onButtonClicked),
            ],),
          ),
        ],
      ),
    );
  }
  int turn=0;
void onButtonClicked(int index){
  if(board[index].isEmpty) {
    if (turn.isEven) {
      board[index] = 'X';
    }
    else{
      board[index] = 'O';
    }
    turn++;
    if(getWinner('X')){
      showDialog(context: context, builder: (context)=>dialogC(winnerName: args.player1Name,));
      player1Score++;
      initGame();
    }
    else if(getWinner('O')){
      showDialog(context: context, builder: (context)=>dialogC(winnerName: args.player2Name,));
      player2Score++;
      initGame();
    }
    if(turn==9){
      initGame();
    }
    setState(() {

    });
  }
}
bool getWinner(String symbol){
  //row
  for(int i=0;i<9;i+=3){
    if(board[i]==symbol && board[i+1]==symbol && board[i+2]==symbol){
      return true;
    }
  }
  //column
  for(int i=0;i<3;i++){
    if(board[i]==symbol && board[i+3]==symbol && board[i+6]==symbol){
      return true;
    }
    //diagonal
    if(board[2]==symbol && board[4]==symbol && board[6]==symbol){
      return true;
    }
    if(board[0]==symbol && board[4]==symbol && board[8]==symbol){
      return true;
    }
  }
  return false;
}
void initGame(){
  board=[
    '','','',
    '','','',
    '','','',
  ];
  turn=0;
}
}
class playerScreenArgs{
  String player1Name;
  String player2Name;
  playerScreenArgs({required this.player1Name,required this.player2Name});
}