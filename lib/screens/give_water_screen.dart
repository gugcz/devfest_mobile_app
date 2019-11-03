import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/components/fraction_item.dart';
import 'package:devfest_mobile_app/components/gug_logo.dart';
import 'package:flutter/material.dart';

class GiveWaterScreen extends StatefulWidget {
  GiveWaterScreen({Key key}) : super(key: key);

  @override
  _GiveWaterScreenState createState() => _GiveWaterScreenState();
}

class _GiveWaterScreenState extends State<GiveWaterScreen> {
  final numberFieldController = TextEditingController();

  FractionItemModel wastelandModel =
      FractionItemModel(true, AssetImage('assets/wasteland.png'), 'Wasteland');

  FractionItemModel emeraldCityModel = FractionItemModel(
      false, AssetImage('assets/emerald_city.png'), 'Emerald city');

  FractionItemModel spaceshipModel =
      FractionItemModel(false, AssetImage('assets/spaceship.png'), 'Spaceship');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      'Water (40 l available)',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      width: 100,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 25),
                        controller: numberFieldController,
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
                        onPressed: () {},
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
}
