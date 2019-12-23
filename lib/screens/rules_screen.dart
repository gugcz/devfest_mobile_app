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
                    padding: EdgeInsets.only(bottom: 5),
                    child: Text(
                      "Contest rules",
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      "DevFest.cz Game",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Content",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 30,
                    ),
                    child: Text(
                      "1. Basic information about the Game, its Organiser and its duration\n" +
                          "2. Game rules\n" +
                          "3. Conditions of participation in the Game\n" +
                          "4. Game principle\n" +
                          "5. Prizes\n" +
                          "6. Winners and handling the prizes\n" +
                          "7. Personal data protection\n" +
                          "8. Other information",
                      style: TextStyle(fontSize: 16, height: 1.75),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      "1. Basic information about the Game, its Organiser and its duration",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'DevFest.cz Game',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' (further referred to as „',
                          ),
                          TextSpan(
                            text: 'Game',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                '“) is the name of the game organised by non-profitable organisation ',
                          ),
                          TextSpan(
                            text: 'GUG.cz, z.s.',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ', Rybná 716/24, 110 00, Praha 1, ID: 03961273, registered with the organisation registry managed by the Municipal Court in Prague, section L, insert 62241 (“Organiser“) in mobile app "',
                          ),
                          TextSpan(
                            text: 'DevFest.cz',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                '” used during conference and festival DevFest.cz 2019 organised by the same Organiser.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'The Game will start on Saturday, November 9, 2019 ',
                          ),
                          TextSpan(
                            text: 'at 8:00',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' and end on the same day ',
                          ),
                          TextSpan(
                            text:
                                'at 18:00. The Winners will be selected by 18:30',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' on that day based on the highest score gained in the Game from all Players who participated in the Game and fulfill the conditions of the Game.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      "2. Game rules",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "These Contest Rules are published on the Organiser's website – 2019.devfest.cz – and in the mobile application ",
                          ),
                          TextSpan(
                            text: 'DevFest.cz',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' The rules are valid since the moment they are published and signed. By registering for the Game during the game period, the Player agrees to these rules.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "The Contest Rules may also be published and communicated in a shorter version on promotional materials of the Organiser, but the only document that states the whole Contest Rules is the document ",
                          ),
                          TextSpan(
                            text: 'Contest Rules: DevFest.cz',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ' published on the website of the Organiser and in the mobile app ',
                          ),
                          TextSpan(
                            text: 'DevFest.cz',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: '.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      "3. Conditions of participation in the Game",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "The Player of the ",
                          ),
                          TextSpan(
                            text: 'DevFest.cz Game',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                " (“Player”) can only be a person older than 15 years of age who is a participant at the developers' conference and festival DevFest.cz 2019, paid for their participation in the conference and festival and fulfilled other conditions stated in these rules. The Organiser is entitled to check the fulfillment of the conditions of participation in the Game.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "Persons younger than 18 years of age can only participate in the Game if agreed by their legal representative and the Organiser is entitled to check such agreement.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "Persons who are in work relation or other type of relation to the Organiser and persons directly or indirectly cooperating in the Game are automatically excluded from participation in the Game. Also excluded are persons who give incorrect details about themselves during the registration process or otherwise do not comply with these rules or break them or act immorally (especially if they employ fraudulent practices in the Game). Excluded Players lose their right to receive a prize without any substitution.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      "4. Game principle",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "To participate in the Game, the conference attendee must register in the Game by using their registration code from their identification badge which they will receive when they register for the conference on site. After a successful registration, the attendee will be offered to participate in the Game.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "The Winners will be selected based on the highest score gained in the mobile application ",
                          ),
                          TextSpan(
                            text: "DevFest.cz",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                " by fulfilling game tasks from all Players who will ",
                          ),
                          TextSpan(
                            text:
                                "be present at the closing ceremony after 18:30 on the conference day and will come up on stage when asked to",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ". Duplicate registrations will be ignored. ",
                          ),
                          TextSpan(
                            text: "There will be five (5) Winners announced.",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      "5. Prizes",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "The Players have a chance to win interesting and valuable prizes from the ",
                          ),
                          TextSpan(
                            text: "partners of the conference and festival",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ". These prizes will be presented before announcing the winners. The Organiser is not responsible for technical state and quality of the prizes. ",
                          ),
                          TextSpan(
                            text:
                                "It is not possible to pay out the value of the prize in cash",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text:
                                ", swap it for other prizes or other compensation. The Player does not have any right to compensation for any expenses related to participation in the Game or the prize. it is not possible to legally demand the prizes and there is no legal claim for the prizes by participating in the Game.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "A prize with value over CZK 10,000 is, according to law 586/1992 Coll., about income taxes, subjected to income tax. The Winner must then declare the value of such prize in their tax return.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      "6. Winners and handling the prizes",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "The Winner is a Player of the Game who was chosen by the Organiser from a list of Players as the Player with the highest score, states true information during the registration process and fulfilled other conditions in these rules, especially agreed to processing their personal details, publishing their name and surname and use of audio and video records related to them and has not withdrawn from such agreement until 23:59 December 31, 2019 (“Winner”).",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "The Players will be informed about winning a prize by the host in the main conference room during the closing ceremony. The Winner must come and take the prize in person on the stage and during a period stated by the Organiser. Before receiving the prize, the Winner must identify themselves with their badge and sign the agreement to use of audio and video materials by the Organiser. If the Winner is younger than 18 years of age, they must also confirm that their legal representative agrees to their participation in the Game.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "If the Winner does not receive the prize under the conditions stated in these rules in the period of time from the host, their claim for the prize is lost and the host will announce another Winner. The Organiser is not responsible for non-delivery of the announcement due to reasons which are not caused by the Organiser, such as low attention of the audience or introduction of a wrong registration code.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      "7. Personal data protection",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "By participating in the Game, the Player expresses their agreement to the processing of their personal data such as name and surname and email address by the Organiser under the Regulation (EU) 2016/679 and other national laws. The Organiser can use the personal data for marketing purposes during the conference day which is November 9, 2019.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "After becoming a winner, the Player agrees to publishing of their name and surname, recording of audio and video materials and processing of such data in order to present the Game and its Winners, including the use in promotional materials of the Organiser. The Player of the Game agrees to this for free and for 1 year after receiving the prize.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "It is voluntary to state their personal details. The Player can withdraw their agreement at any time. However, if the Player withdraws their agreement with use of their personal data or with recording of audio and video materials before the end of the Game, their claim for the prize is lost.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: Text(
                      "8. Other information",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "The Organiser has the right to change the rules of the Game even during the Game without any previous announcement. The change becomes valid when it is published on the website of the Organiser and in the mobile application DevFest.cz.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "This also applies to the right of the Organiser to change the time period of the Game or to interrupt or stop the Game completely. The Organiser is not responsible for any damages related to the Player's participation in the Game, use of the prize, or inaccessibility of technical devices and networks necessary for participation in the Game.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 25),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "The Organiser has ultimate right to decide in disputable questions regarding the Game and in Players' objections to the Game. The Players may present their objections  to the Game on site within 10 minutes after the announcement of the Winners to any member of staff who will then contact the main organiser of the conference. Later objections will not be considered. The Organiser's decision about the objections is always final.",
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 16.0,
                          height: 1.5,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                "The Apple, Inc. company is not a sponsor or any other party of this Game.",
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
