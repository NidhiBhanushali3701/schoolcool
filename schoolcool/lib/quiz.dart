import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:schoolcool/constants.dart';
import 'package:schoolcool/Quiz_components/body.dart';
import 'package:get/get.dart';
import 'package:schoolcool/controllers/question_controller.dart';
import 'controllers/question_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question({this.id, this.question, this.answer, this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question":
    "H2S is more acidic than H2O because",
    "options": ['O > electronegative than S.', 'ATM NO of S is higher than O. ', 'H — S bond dissociation energy < to H — O bond.', 'H — O bond dissociation energy is less also compared to H — S bond'],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "In the manufacture of sulphuric acid by contact process Tyndall box is used to",
    "options": ['convert SO2 and SO3', ' test the presence of dust particles', 'filter dust particles', 'remove impurities'],
    "answer_index": 1,
  },
  {
    "id": 3,
    "question": "Fluorine differs from rest of the halogens in some of its properties. This is due to",
    "options": ['its smaller size and high electronegativity.', 'lack of d-orbitals.', 'low bond dissociation energy', 'All of the these.'],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question": "Transistion metals, despite high E° oxidation, are poor reducing agents. The incorrect reason is",
    "options": [' high heat of vaporization', 'high ionization energies.', 'low heats of hydration.', 'complex forming nature.'],
    "answer_index": 3,
  },
  {
    "id": 5,
    "question": "Anomalous electronic configuration in the 3d series are of",
    "options": ['Cr and Fe', 'Cu and Zn', 'Fe and Cu', 'Cr and Cu'],
    "answer_index": 3,
  },
];

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  void getting() async {
    var data = await FirebaseFirestore.instance.collection('questions').get();
    int i = sample_data.length;
    for (var d in data.docs) {
      i++;
      var d_ = d.data();
      sample_data.add({
        "id": i,
        "question": '${d.data()['question']}',
        "options": '${d.data()['answer']}',
        "answer_index": '${d.data()['ans']}',
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getting();
  }
  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Quiz",
          style: TextStyle(
            fontSize: 30,
            color: kPrimaryLightColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        elevation: 0.0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_forward,
              color: kPrimaryLightColor,
            ),
            onPressed: () {
              _controller.nextQuestion;
            },
          ),
          // FlatButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryLightColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Body(questionDB: sample_data,),
    );
  }
}
