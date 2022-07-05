// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Quotes(),
    );
  }
}

class Quotes extends StatefulWidget {
  const Quotes({Key? key}) : super(key: key);

  @override
  State<Quotes> createState() => _QuotesState();
}

// class for card-quote(title, author)
class BestQuotes {
  String title;
  String author;
  BestQuotes({required this.title, required this.author});
}

class _QuotesState extends State<Quotes> {
  // list of all quotes
  List allQuotes = [
    BestQuotes(
        author: "~ DOLLY PARTON ~",
        title:
            "The way I see it if you want the rainbow , you gotta out up with the rain"),
    BestQuotes(
        author: "Albert Einstein",
        title:
            "Life is like riding a cycle. To keep your balance, you must keep moving."),
    BestQuotes(
        author: "Milton Berle",
        title: "If opportunity doesn't knock, build a door."),
    BestQuotes(
        author: "Steve Jobs",
        title: "The Only Way To Do Great Work is To Love What you Do"),
        
  ];

// To delete card-quote when clicking on delete icon
  delete(BestQuotes item) {
    setState(() {
      allQuotes.remove(item);
    });
  }

// To add new card-quote to the main screen when clicking on "ADD" in showModalBottomSheet
  addNewQuote() {
    setState(() {
      allQuotes.add(
        BestQuotes(author: myController2.text, title: myController.text),
      );
    });
  }

// create 2 controllers to get the text from the textfield
  final myController = TextEditingController();
  final myController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[900],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  color: Colors.orange[900],
                  child: Padding(
                    padding: const EdgeInsets.all(22),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.orange[600],
                        borderRadius: BorderRadius.circular(55),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.8),
                            spreadRadius: 5,
                            blurRadius: 3,
                            offset: Offset(0, 6), // changes position of shadow
                          ),
                        ],
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: 20),
                            child: Icon(Icons.arrow_downward,size: 50,),
                          ),
                            SizedBox(height: 150,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                controller: myController,
                                decoration:
                                    InputDecoration(hintText: "Add new quote",hintStyle: TextStyle(fontFamily: 'Banger',)),
                                maxLength: 20,
                              ),
                              SizedBox(
                                height: 22,
                              ),
                              TextField(
                                controller: myController2,
                                decoration: InputDecoration(hintText: "Add author" , hintStyle: TextStyle(fontFamily: 'Banger',)),
                                maxLength: 20,
                                
                              ),
                              SizedBox(
                                height: 22,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    addNewQuote();
                                  },
                                  
                                  child: Text(
                                    "ADD",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.grey[900],
                                      fontFamily: 'Banger',
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
              isScrollControlled: true
              );
        },
        backgroundColor: Colors.orange[300],
        child: Icon(
          Icons.add,
          color: Colors.grey[900],
          size: 30,
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange[300],
        title: Text(
          "Best Quotes",
          style: TextStyle(
            fontSize: 35,
            color: Colors.grey[900],
            fontFamily: 'Glitch',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: allQuotes
              .map((item) => CardWidget(
                    // To pass the( item inside the list) to "card.dart" file
                    item: item,
                    // To pass (the delete function) to "card.dart" file
                    delete: delete,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
