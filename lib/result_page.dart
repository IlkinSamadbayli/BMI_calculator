import 'package:bmi_application/consts.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double result;

  const ResultPage({Key? key, required this.result}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late String resultText;
  late Color colorNum;

  @override
  void initState() {
    if (widget.result >= 18.5 && widget.result <= 24.9) {
      resultText = 'Normal';
      colorNum = Colors.grey.shade600;
    } else if (widget.result <= 18.5) {
      resultText = 'Underweight';
      colorNum = Colors.green.shade600;
    } else if (widget.result >= 25 && widget.result <= 29.9) {
      resultText = 'Overweight';
      colorNum = Colors.red.shade300;
    } else if (widget.result >= 30) {
      resultText = 'Obesy';
      colorNum = Colors.red.shade600;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8, height: 24),
                  Text(
                    'Your result page',
                    style: AppConstants.kTextStyle.copyWith(fontSize: 25),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 300,
                decoration: AppConstants.kBoxDecoration,
                padding: const EdgeInsets.all(64),
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Text(
                      resultText,
                      style: AppConstants.kTextStyle.copyWith(fontSize: 30),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      widget.result.toStringAsFixed(1),
                      style: AppConstants.kNumStyle.copyWith(
                        fontSize: 40,
                        color: colorNum,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
