import 'package:bmi_application/result_page.dart';
import 'package:flutter/material.dart';
import 'consts.dart';

class HOMESCREEN extends StatefulWidget {
  const HOMESCREEN({Key? key}) : super(key: key);

  @override
  State<HOMESCREEN> createState() => _HOMESCREENState();
}

class _HOMESCREENState extends State<HOMESCREEN> {
  double heightValue = 165;
  int weight = 80;
  int age = 27;
  Color colorMale = const Color.fromARGB(255, 37, 72, 126);
  Color colorFeMale = const Color.fromARGB(255, 37, 72, 126);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 16, 97, 196),
        centerTitle: true,
        title: const Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    genderBox(genderIcon: Icons.male, genderText: "MALE"),
                    const SizedBox(width: 16),
                    genderBox(genderIcon: Icons.female, genderText: "FEMALE"),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  decoration: AppConstants.kBoxDecoration,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: heightBox(),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    agedBox(prop: 'WEIGHT', num: weight),
                    const SizedBox(width: 16),
                    agedBox(prop: 'AGE', num: age),
                  ],
                ),
              ],
            ),
          ),
          BottomAppBar(
            child: calculateButton(),
          ),
        ],
      ),
    );
  }

  Widget heightBox() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'HEIGHT',
            style: AppConstants.kTextStyle.copyWith(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            '${heightValue.toStringAsFixed(1)}sm',
            style: AppConstants.kNumStyle,
          ),
          const SizedBox(height: 25),
          Slider(
            value: heightValue,
            min: 150,
            max: 210,
            onChanged: (value) => {
              setState(
                () {
                  heightValue = value;
                },
              ),
            },
          ),
        ],
      ),
    );
  }

  Widget calculateButton() {
    return GestureDetector(
      onTap: () {
        double result = weight * 10000 / (heightValue * heightValue);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => ResultPage(result: result)),
        );
      },
      child: Container(
        height: 64,
        padding: const EdgeInsets.symmetric(vertical: 20),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        color: Colors.pink,
        child: const Text(
          'CALCULATE',
          style: AppConstants.kTextStyle,
        ),
      ),
    );
  }

  Widget genderBox({IconData? genderIcon, String? genderText}) {
    bool isMale = genderText == "MALE";
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            if (isMale) {
              colorMale = const Color.fromARGB(255, 25, 68, 185);
              colorFeMale = const Color.fromARGB(255, 37, 72, 126);
            } else {
              colorMale = const Color.fromARGB(255, 37, 72, 126);
              colorFeMale = Colors.pink;
            }
          });
        },
        child: Container(
          padding: const EdgeInsets.all(45),
          decoration: BoxDecoration(
            color: isMale ? colorMale : colorFeMale,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                genderIcon,
                color: Colors.white,
                size: 80,
              ),
              const SizedBox(height: 16),
              Text(
                genderText!,
                style: AppConstants.kTextStyle,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget agedBox({String? prop, int? num}) {
    bool condition = prop == 'WEIGHT';
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: AppConstants.kBoxDecoration,
        child: Column(
          children: [
            Text(
              prop!,
              style: AppConstants.kTextStyle
                  .copyWith(fontSize: 20, letterSpacing: 2),
            ),
            const SizedBox(height: 24),
            Text(
              num.toString(),
              style: AppConstants.kNumStyle.copyWith(
                fontSize: 35,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: (() {
                      setState(
                        () {
                          if (condition) {
                            weight--;
                          } else {
                            age--;
                          }
                        },
                      );
                    }),
                    child: circleButton(circleIcon: Icons.remove)),
                const SizedBox(width: 36),
                GestureDetector(
                    onTap: (() {
                      setState(
                        () {
                          if (condition) {
                            weight++;
                          } else {
                            age++;
                          }
                        },
                      );
                    }),
                    child: circleButton(circleIcon: Icons.add)),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget circleButton({IconData? circleIcon}) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.blueGrey[400], shape: BoxShape.circle),
      child: Icon(
        circleIcon,
        color: Colors.white,
        size: 48,
      ),
    );
  }
}
