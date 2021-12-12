import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schoolcool/controllers/question_controller.dart';
import 'package:schoolcool/controllers/questions.dart';
import 'package:schoolcool/home.dart';
import '../../../constants.dart';
import 'option.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    // it means we have to pass this
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: kBlackColor),
            ),
            SizedBox(height: kDefaultPadding / 2),
            ...List.generate(
              question.options.length,
              (index) => Option(
                index: index,
                text: question.options[index],
                press: () => _controller.checkAns(question, index),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Text("SUBMIT",
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                    ))),
          ],
        ),
      ),
    );
  }
}
