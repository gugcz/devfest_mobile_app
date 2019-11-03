import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/components/fraction_item.dart';
import 'package:flutter/material.dart';

class GiveWaterScreen extends StatefulWidget {
  GiveWaterScreen({Key key}) : super(key: key);

  @override
  _GiveWaterScreenState createState() => _GiveWaterScreenState();
}

class _GiveWaterScreenState extends State<GiveWaterScreen> {
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 100),
            child: Text(
              'Fraction',
              style: TextStyle(
                fontSize: 36,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    borderRadius: BorderRadius.circular(12),
                    onTap: () {
                      setState(() {
                        wastelandModel = FractionItemModel(true,
                            AssetImage('assets/wasteland.png'), 'Wasteland');

                        emeraldCityModel = FractionItemModel(
                            false,
                            AssetImage('assets/emerald_city.png'),
                            'Emerald city');

                        spaceshipModel = FractionItemModel(false,
                            AssetImage('assets/spaceship.png'), 'Spaceship');
                      });
                    },
                    child: FractionItem(
                      wastelandModel,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        wastelandModel = FractionItemModel(false,
                            AssetImage('assets/wasteland.png'), 'Wasteland');

                        emeraldCityModel = FractionItemModel(
                            true,
                            AssetImage('assets/emerald_city.png'),
                            'Emerald city');

                        spaceshipModel = FractionItemModel(false,
                            AssetImage('assets/spaceship.png'), 'Spaceship');
                      });
                    },
                    child: FractionItem(
                      emeraldCityModel,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        wastelandModel = FractionItemModel(false,
                            AssetImage('assets/wasteland.png'), 'Wasteland');

                        emeraldCityModel = FractionItemModel(
                            false,
                            AssetImage('assets/emerald_city.png'),
                            'Emerald city');

                        spaceshipModel = FractionItemModel(true,
                            AssetImage('assets/spaceship.png'), 'Spaceship');
                      });
                    },
                    child: FractionItem(
                      spaceshipModel,
                    ),
                  ),
                ],
              )
              /*SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            height: 70,
                            image: AssetImage('assets/wasteland.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                            ),
                            child: Text(
                              'Wasteland',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: DecoratedBox(
                    decoration: const BoxDecoration(color: Colors.red),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            height: 70,
                            image: AssetImage('assets/wasteland.png'),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 5,
                            ),
                            child: Text(
                              'Wasteland',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),*/
              ),
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
