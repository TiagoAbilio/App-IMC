import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:imc/controller/controller.dart';
import 'package:imc/ui/result.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ControllerHome>(
        init: ControllerHome(),
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.blueGrey[900],
            body: LayoutBuilder(
              builder: (context, constraints) {
                return LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                                right: 5, left: 5, top: 20),
                            child: Column(
                              children: [
                                // ignore: prefer_const_constructors
                                Center(
                                  // ignore: prefer_const_constructors
                                  child: Text(
                                    "BMI Calculator",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        _.selectSexo("h");
                                      },
                                      child: GetBuilder<ControllerHome>(
                                        id: "sexo",
                                        builder: (_) {
                                          return Container(
                                            width: constraints.maxWidth * 0.48,
                                            height:
                                                constraints.maxHeight * 0.25,
                                            decoration: BoxDecoration(
                                                color: _.hmuder
                                                    ? Colors.white38
                                                    : Colors.white12,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.male,
                                                  color: Colors.white,
                                                  size: 75,
                                                ),
                                                Text(
                                                  "MALE",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _.selectSexo("m");
                                      },
                                      child: GetBuilder<ControllerHome>(
                                        id: "sexo",
                                        builder: (_) {
                                          return Container(
                                            width: constraints.maxWidth * 0.48,
                                            height:
                                                constraints.maxHeight * 0.25,
                                            decoration: BoxDecoration(
                                                color: _.mmuder
                                                    ? Colors.white38
                                                    : Colors.white12,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.female,
                                                  color: Colors.white,
                                                  size: 75,
                                                ),
                                                Text(
                                                  "FEMALE",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 25),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  width: constraints.maxWidth,
                                  height: constraints.maxHeight * 0.25,
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "HEIGHT",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      GetBuilder<ControllerHome>(
                                        id: "altura",
                                        builder: (_) {
                                          return Row(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Text(
                                                "${_.altura.round()}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 40,
                                                ),
                                              ),
                                              Container(
                                                margin: EdgeInsets.only(
                                                    bottom: 6, left: 8),
                                                child: Text(
                                                  "cm",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      ),
                                      GetBuilder<ControllerHome>(
                                        id: "teste",
                                        builder: (_) {
                                          return Slider(
                                            value: _.increment,
                                            max: 300,
                                            min: 0,
                                            thumbColor: Colors.red,
                                            activeColor: Colors.white,
                                            inactiveColor: Colors.white60,
                                            onChanged: (double value) {
                                              _.alterValue(value);
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: constraints.maxWidth * 0.48,
                                      height: constraints.maxHeight * 0.30,
                                      decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "WEIGHT",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          GetBuilder<ControllerHome>(
                                            id: "peso",
                                            builder: (_) {
                                              return Text(
                                                "${_.peso.round()}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 45,
                                                ),
                                              );
                                            },
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  _.descrePeso();
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white54,
                                                  ),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _.incrementPeso();
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white54,
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: constraints.maxWidth * 0.48,
                                      height: constraints.maxHeight * 0.30,
                                      decoration: BoxDecoration(
                                          color: Colors.white12,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "AGE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          GetBuilder<ControllerHome>(
                                            id: "idade",
                                            builder: (_) {
                                              return Text(
                                                "${_.idade.round()}",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 45,
                                                ),
                                              );
                                            },
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  _.descrIdade();
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white54,
                                                  ),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  _.incrementIdade();
                                                },
                                                child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.white54,
                                                  ),
                                                  child: Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_.sexo != "") {
                                _.calculateIMC().then(
                                      (value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ResultIMC(),
                                        ),
                                      ),
                                    );
                              } else {
                                final snackBar = SnackBar(
                                  content: const Text("Selecione o Sexo"),
                                  backgroundColor: Colors.amberAccent,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: constraints.maxWidth,
                              color: Colors.pink,
                              child: Text(
                                "CALCULATE",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
