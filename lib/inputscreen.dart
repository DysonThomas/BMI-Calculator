import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusablecards.dart';
import 'constant.dart';
import 'calculator_bmi.dart';
import 'package:bmi_calculator/result.dart';

const activecardColours = Color(0xFF1D1E33);
const inactivecardColours = Color(0xFF111328);
enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: Reusablecards(
                    colour: selectedGender == Gender.male
                        ? activecardColours
                        : inactivecardColours,
                    cardChild: iconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  child: Reusablecards(
                    colour: selectedGender == Gender.female
                        ? activecardColours
                        : inactivecardColours,
                    cardChild: iconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: Container(
                  child: Reusablecards(
                      colour: inactivecardColours,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Height',
                            style: kTextsyles,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                height.toString(),
                                style: kBoldTextsyles,
                              ),
                              const Text(
                                'cm',
                                style: kTextsyles,
                              )
                            ],
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                                thumbShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: RoundSliderThumbShape(
                                    enabledThumbRadius: 30.0),
                                overlayColor: Color(0xFFEB1555),
                                thumbColor: Color(0xFFEB1555),
                                activeTrackColor: Colors.white),
                            child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                inactiveColor: Color(0xFF8D8E98),
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                }),
                          )
                        ],
                      )),
                ),
              ),
            ],
          )),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    child: Reusablecards(
                      colour: inactivecardColours,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Weight',
                            style: kTextsyles,
                          ),
                          Text(
                            weight.toString(),
                            style: kBoldTextsyles,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 5),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  icon: const Icon(Icons.remove),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Reusablecards(
                      colour: inactivecardColours,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Age',
                            style: kTextsyles,
                          ),
                          Text(
                            age.toString(),
                            style: kBoldTextsyles,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(width: 5),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.grey,
                                child: IconButton(
                                  // splashColor: Colors.green,
                                  icon: const Icon(Icons.remove),
                                  color: Colors.white,
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              calculator_bmi calc =
                  calculator_bmi(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.calculateBmi(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ));
            },
            child: Container(
              child: Center(
                child: Text('CALCULATE',
                    style: TextStyle(
                        backgroundColor: Colors.pink,
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              color: Colors.pink,
              width: double.infinity,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class Reusablecards extends StatelessWidget {
  Reusablecards({required this.colour, required this.cardChild});
  final Color colour;
  final Widget cardChild;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  // const RoundIconButton({Key? key}) : super(key: key);
  RoundIconButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RawMaterialButton(
        onPressed: onPressed(),
        child: Icon(icon),
        fillColor: Color(0xFF4C4F5e),
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
      ),
    );
  }
}
