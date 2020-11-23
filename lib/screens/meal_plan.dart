import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_plan/animation/water_widget.dart';
import 'package:meal_plan/blocs/animation_bloc.dart';
import 'package:provider/provider.dart';

class MealPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var animationBloc = Provider.of<AnimationBloc>(context);
    return Scaffold(
        body: Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          color: Colors.deepOrange,
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 30.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.keyboard_backspace,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    width: 80.0,
                  ),
                  Text(
                    'Meal Plan',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold, letterSpacing: 1),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.grey.withOpacity(.3)),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(3, 0), // changes position of shadow
                    ),
                  ],
                ),
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Water',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 2,
                          height: 30,
                          color: Colors.deepOrange,
                        ),
                        Text(
                          'Food',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        WaterWidget(
                            flareController: animationBloc.flareController),
                        Positioned(
                            left: 50,
                            top: 80,
                            child: Column(
                              children: [
                                Text(
                                  '${animationBloc.numPercentage}%',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(.6),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'of 3000ml',
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(.6),
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${animationBloc.numMl}/3000ml',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            InkWell(
                              onTap: animationBloc.subWater,
                              child: FaIcon(
                                FontAwesomeIcons.cog,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            border: Border.all(
                                style: BorderStyle.solid,
                                color: Colors.deepOrange.withOpacity(.5),
                                width: 3),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(3, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                  animationBloc.numPercentage < 10
                                      ? "assets/glassE.png"
                                      : "assets/glassNew.png",
                                  width: 20.0,
                                  height: 40.0,
                                  color: Colors.deepOrange),
                              Image.asset(
                                  animationBloc.numPercentage < 20
                                      ? "assets/glassE.png"
                                      : "assets/glassNew.png",
                                  width: 20.0,
                                  height: 40.0,
                                  color: Colors.deepOrange),
                              Image.asset(
                                  animationBloc.numPercentage < 30
                                      ? "assets/glassE.png"
                                      : "assets/glassNew.png",
                                  width: 20.0,
                                  height: 40.0,
                                  color: Colors.deepOrange),
                              Image.asset(
                                  animationBloc.numPercentage < 40
                                      ? "assets/glassE.png"
                                      : "assets/glassNew.png",
                                  width: 20.0,
                                  height: 40.0,
                                  color: Colors.deepOrange),
                              Image.asset(
                                  animationBloc.numPercentage < 50
                                      ? "assets/glassE.png"
                                      : "assets/glassNew.png",
                                  width: 20.0,
                                  height: 40.0,
                                  color: Colors.deepOrange),
                              Image.asset(
                                  animationBloc.numPercentage < 60
                                      ? "assets/glassE.png"
                                      : "assets/glassNew.png",
                                  width: 20.0,
                                  height: 40.0,
                                  color: Colors.deepOrange),
                              Image.asset(
                                  animationBloc.numPercentage < 70
                                      ? "assets/glassE.png"
                                      : "assets/glassNew.png",
                                  width: 20.0,
                                  height: 40.0,
                                  color: Colors.deepOrange),
                              Image.asset(
                                  animationBloc.numPercentage < 80
                                      ? "assets/glassE.png"
                                      : "assets/glassNew.png",
                                  width: 20.0,
                                  height: 40.0,
                                  color: Colors.deepOrange),
                              Image.asset(
                                  animationBloc.numPercentage < 90
                                      ? "assets/glassE.png"
                                      : "assets/glassNew.png",
                                  width: 20.0,
                                  height: 40.0,
                                  color: Colors.deepOrange),
                              Image.asset(
                                  animationBloc.numPercentage < 100
                                      ? "assets/glassE.png"
                                      : "assets/glassNew.png",
                                  width: 20.0,
                                  height: 40.0,
                                  color: Colors.deepOrange),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: InkWell(
                  onTap: animationBloc.addWater,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Center(
                      child: Image.asset(
                        "assets/glassE.png",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    ));
  }
}
