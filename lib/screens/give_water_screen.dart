import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/components/fraction_item.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';
import 'package:devfest_mobile_app/screens/error_giving_water_screen.dart';
import 'package:devfest_mobile_app/screens/loading_screen.dart';
import 'package:devfest_mobile_app/screens/water_given_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:devfest_mobile_app/models/app_model.dart';
import 'package:provider/provider.dart';

class GiveWaterScreen extends StatefulWidget {
  GiveWaterScreen({Key key}) : super(key: key);

  @override
  _GiveWaterScreenState createState() => _GiveWaterScreenState();
}

class _GiveWaterScreenState extends State<GiveWaterScreen> {
  bool loading = false;

  final waterFieldController = TextEditingController();

  FractionItemModel wastelandModel =
      FractionItemModel(true, AssetImage('assets/wasteland.png'), 'Wasteland');

  FractionItemModel emeraldCityModel = FractionItemModel(
      false, AssetImage('assets/emerald_city.png'), 'Emerald city');

  FractionItemModel spaceshipModel =
      FractionItemModel(false, AssetImage('assets/spaceship.png'), 'Spaceship');

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : Scaffold(
            backgroundColor: Config.colorPalette.shade500,
            body: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(30, 100, 30, 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Text(
                          'Fraction',
                          style: TextStyle(
                            fontSize: 36,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                borderRadius: BorderRadius.circular(12),
                                onTap: () {
                                  setState(() {
                                    wastelandModel = FractionItemModel(
                                        true,
                                        AssetImage('assets/wasteland.png'),
                                        'Wasteland');

                                    emeraldCityModel = FractionItemModel(
                                        false,
                                        AssetImage('assets/emerald_city.png'),
                                        'Emerald city');

                                    spaceshipModel = FractionItemModel(
                                        false,
                                        AssetImage('assets/spaceship.png'),
                                        'Spaceship');
                                  });
                                },
                                child: FractionItem(
                                  wastelandModel,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    wastelandModel = FractionItemModel(
                                        false,
                                        AssetImage('assets/wasteland.png'),
                                        'Wasteland');

                                    emeraldCityModel = FractionItemModel(
                                        true,
                                        AssetImage('assets/emerald_city.png'),
                                        'Emerald city');

                                    spaceshipModel = FractionItemModel(
                                        false,
                                        AssetImage('assets/spaceship.png'),
                                        'Spaceship');
                                  });
                                },
                                child: FractionItem(
                                  emeraldCityModel,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    wastelandModel = FractionItemModel(
                                        false,
                                        AssetImage('assets/wasteland.png'),
                                        'Wasteland');

                                    emeraldCityModel = FractionItemModel(
                                        false,
                                        AssetImage('assets/emerald_city.png'),
                                        'Emerald city');

                                    spaceshipModel = FractionItemModel(
                                        true,
                                        AssetImage('assets/spaceship.png'),
                                        'Spaceship');
                                  });
                                },
                                child: FractionItem(
                                  spaceshipModel,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 40),
                      child: Column(
                        children: <Widget>[
                          Text(
                            'Water (' +
                                Provider.of<AppModel>(context, listen: false)
                                    .getActualScore()
                                    .toString() +
                            ' l available)',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Container(
                            width: 100,
                            child: TextField(
                              keyboardType: TextInputType.numberWithOptions(
                                  decimal: false),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 25),
                              controller: waterFieldController,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: OutlineButton(
                              child: Text(
                                "Give",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Config.colorPalette.shade50,
                              splashColor: Config.colorPalette.shade100,
                              highlightColor: Config.colorPalette.shade100,
                              onPressed: () {
                                int fractionId = 0;
                                if (wastelandModel.isSelected) {
                                  fractionId = 1;
                                } else if (emeraldCityModel.isSelected) {
                                  fractionId = 2;
                                } else {
                                  fractionId = 3;
                                }
                                _giveWater(fractionId);
                              },
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(7.0),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: OutlineButton(
                              child: Text(
                                "Back",
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Config.colorPalette.shade50,
                              splashColor: Config.colorPalette.shade100,
                              highlightColor: Config.colorPalette.shade100,
                              onPressed: () {
                                Navigator.pop(
                                  context,
                                );
                              },
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(7.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GUGLogo(),
                  ],
                ),
              ),
            ),
            resizeToAvoidBottomInset: false,
          );
  }

  _giveWater(int fractionId) async {
    print('giveWater');
    print(waterFieldController.value.text);
    if (waterFieldController.value.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Error"),
                content: Text("Please enter amount of water to give!"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]);
          });
    } else if (int.parse(waterFieldController.value.text) >
        Provider.of<AppModel>(context, listen: false).getActualScore()) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
                title: Text("Error"),
                content: Text("You do not have enought water!"),
                actions: <Widget>[
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ]);
          });
    } else {
      setState(() {
        loading = true;
      });

      try {
        final HttpsCallable callable = CloudFunctions.instance.getHttpsCallable(
          functionName: 'giveWater',
        );

        dynamic resp = await callable.call(<String, dynamic>{
          'number': Provider.of<AppModel>(context, listen: false).getUID(),
          'fractionId': fractionId.toString(),
          'water': waterFieldController.value.text.toString()
        });

        if (resp.data['type'] == 'waterGivenSuccessfully') {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => WaterGivenScreen(),
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ErrorGivingWaterScreen(),
            ),
          );
        }
      } catch (exception) {
        print(exception);
        setState(() {
          loading = false;
        });
      }
    }
  }
}
