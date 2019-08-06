import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> score = [];
  List<String> questions = [
    'First',
    'Second',
    'Third',
  ];
  List<bool> answers = [true, false, false];
  int index = 0;
  Icon correct = Icon(Icons.check, color: Colors.green);
  Icon wrong = Icon(Icons.close, color: Colors.red);
  int ButtonId = 0;
  Icon CheckAnswer() {
    print('ButtonID: $ButtonId, index: $index');
    return (ButtonId == 1 && answers[index % 3] ||
            ButtonId == 2 && !answers[index % 3]
        ? correct
        : wrong);
  }

  List<Icon> getLast(int last) {
    List<Icon> res = [];
    while (score.length < last && last >= 0) {
      --last;
    }
    int ln = score.length;
    print('Score Size: $ln, Last: $last');
    for (int i = last; i >= 0; --i) {
      res.add(score[score.length - 1 - i]);
    }
    return res;
  }

  void ButtonPressed(int id) {
    setState(() {
      ButtonId = id;
      score.add(CheckAnswer());
      ++index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Icon> scores = getLast(3);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questions[index % 3],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => ButtonPressed(1),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => ButtonPressed(2),
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: scores,
          ),
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
