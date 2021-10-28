import 'package:flutter/material.dart';
import 'package:sakafa/Question.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int index = 0;
  List Questions = [
    Question.name("Marrakesh is the capital of Morocco", false, "it's Rabat"),
    Question.name("There are two parts of the body that can't heal themselves",
        false, "False - there's only one: the teeth."),
    Question.name(
        "The Great Wall of China is longer than the distance between London and Beijing",
        true,
        "London to Beijing is only 8,136 km, The Great Wall of China is 21,196.18 km"),
    Question.name(
        "'A' is the most common letter used in the English language",
        false,
        "'E' is the most common letter and appears in 11 percent of all english words, according to Oxford Dictionaries"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) => Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          ),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'Images/knowledge.jpg',
                  width: 200,
                  height: 200,
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.transparent,
                      border: Border.all(
                          color: Colors.blueGrey.shade600,
                          style: BorderStyle.solid)),
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      Questions[index].question,
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    )),
                  )),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RawMaterialButton(
                      onPressed: () => _checkAnswer(true, context),
                      child: Text(
                        'True',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () => _checkAnswer(false, context),
                      child:
                          Text('False', style: TextStyle(color: Colors.white)),
                    ),
                    RawMaterialButton(
                        onPressed: () => _change(context),
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.white,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool x, BuildContext context) {
    if (x == Questions[index].isCorrect) {
      final snackbar = SnackBar(
        content: Text('Correct!'),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      final snackbar = SnackBar(
        content: Text('Inorrect!'),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  _change(BuildContext context) {
    setState(() {
      index = (index + 1) % Questions.length;
    });
  }
}
