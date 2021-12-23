import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:imc/controller/controller.dart';
import 'package:imc/ui/home.dart';

class ResultIMC extends StatefulWidget {
  const ResultIMC({Key? key}) : super(key: key);

  @override
  _ResultIMCState createState() => _ResultIMCState();
}

class _ResultIMCState extends State<ResultIMC> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerHome>(
      init: ControllerHome(),
      builder: (_) => Material(
        color: Colors.blueGrey[900],
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    color: Colors.transparent,
                    margin: const EdgeInsets.only(
                        right: 5, left: 5, top: 30, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_rounded,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: constraints.maxWidth * 0.2,
                            ),
                            Text(
                              "BMI CALCULATOR",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 5,
                              top: constraints.maxHeight * 0.06,
                              bottom: constraints.maxHeight * 0.09),
                          child: Text(
                            "Your Result",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ),
                        Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(
                                top: constraints.maxHeight * 0.08, bottom: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "UNDERWEIGHT",
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: constraints.maxHeight * 0.1,
                                      bottom: constraints.maxHeight * 0.1),
                                  child: Text(
                                    "${_.imc.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontSize: 80,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  _.resultIMC,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _.recalculate().then((value) {
                        _.update(["sexo", "altura", "peso", "idade", "teste"]);
                        Navigator.pop(context);
                      });
                    },
                    child: Container(
                        alignment: Alignment.center,
                        color: Colors.pink,
                        height: constraints.maxHeight * 0.1,
                        width: constraints.maxWidth,
                        child: Text(
                          "RE-CALCULATE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        )),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
