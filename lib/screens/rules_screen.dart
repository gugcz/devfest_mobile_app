import 'package:devfest_mobile_app/config.dart';
import 'package:devfest_mobile_app/utils/no_glow_effect_behaviour.dart';
import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/devfest_logo.dart';

class RulesScreen extends StatelessWidget {
  RulesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Config.colorPalette.shade500,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: ScrollConfiguration(
            behavior: NoGlowEffectBehavior(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, top: 50),
                    child: DevFestLogo(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "Contest rules",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Table of contents",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      "1. Základní informace o soutěži, pořadatel a doba trvání soutěže\n" +
                          "2. Pravidla soutěže\n" +
                          "3. Podmínky účasti v soutěži\n" +
                          "4. Princip soutěže\n" +
                          "5. Výhra\n" +
                          "6. Výherci a předání výher\n" +
                          "7. Ochrana osobních údajů\n" +
                          "8. Další informace",
                      style: TextStyle(fontSize: 16, height: 1.75),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: Text(
                      "1. Základní informace o soutěži, pořadatel a doba trvání soutěže",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'CeloDevFestová hra',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' (dále také jen jako „',
                          ),
                          TextSpan(
                            text: 'soutěž',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '“) je název soutěže pořádané spolkem ',
                          ),
                          TextSpan(
                            text: 'GUG.cz, z.s.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ', se sídlem Rybná 716/24, 110 00, Praha 1, IČ: 03961273, zapsané ve spolkovém rejstříku vedeném Městským soudem v Praze, oddíl L, vložka 62241 (dále také jen jako „pořadatel“), a to v mobilní aplikaci ',
                          ),
                          TextSpan(
                            text: 'DevFest.cz 2019',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '.',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
