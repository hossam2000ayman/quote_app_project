// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../main.dart';

class CardWidget extends StatelessWidget {
  final Function delete;
  final BestQuotes item;

  const CardWidget({
    Key? key,
    required this.delete,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.orange[400],
      margin: EdgeInsets.all(11),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Center(
        child: Container(
          padding: EdgeInsets.all(11),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(item.title,
                  style: TextStyle(fontSize: 27, color: Colors.grey[900],fontFamily: 'Banger' ),
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.author,
                      style: TextStyle(fontSize: 17, color: Colors.grey[900] , fontWeight: FontWeight.bold ,fontFamily: 'Banger'),
                      ),
                  IconButton(
                    onPressed: () {
                      delete(item);
                    },
                    icon: Icon(Icons.delete),
                    iconSize: 27,
                    color: Colors.grey[900],
                  ),
                  
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
