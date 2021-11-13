

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  late DragStartDetails startVerticalDragDetails;
  late DragUpdateDetails updateVerticalDragDetails;


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        appBar: AppBar(
          title: const Center(
            child: Text('Detector de Gestos'),
          ),
          backgroundColor:  Theme.of(context).colorScheme.primary,
        ),
        body: GestureDetector( //Detecta gestos na horiznotal usar o dy pode mudar para vertical
          onVerticalDragStart: (dragDetails) {
            startVerticalDragDetails = dragDetails;
          },
          onVerticalDragUpdate: (dragDetails) {
            updateVerticalDragDetails = dragDetails;
          },
          onVerticalDragEnd: (endDetails) {
            double dx = updateVerticalDragDetails.globalPosition.dx -
                startVerticalDragDetails.globalPosition.dx;
            String text = 'Neutral';
            if(dx<0){
                text = 'Swipe Left!';
            }else if(dx>0){
                text = 'Swipe Right!';
            }
            var snackBar = SnackBar(
              content:Text(text) ,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
          child:  SizedBox.expand(
            child:Container(
              child: MeuBotao(),
            ),
          ),
        )
    );
  }
}

class MeuBotao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector( //Detector de eventos ou gestos
      onLongPress: (){
        const snackBar = SnackBar(
          content: Text("Long Press!"),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: Center(
        child:Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(8.0)
            ),
            child: const Text("Aperte e Segure!"),
        ),
      ),
    );
  }

}