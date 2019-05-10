import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/entities/speaker.dart';

class TalkSpeakerInfo extends StatelessWidget {
  final Speaker speaker;

  TalkSpeakerInfo({
    Key key,
    @required this.speaker,
  }) : super(key: key);

  Widget buildSpeakerName() {
    return Text(
      speaker.name,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
  }

  Widget buildSpeakerCompany() {
    if (speaker.company != null && speaker.company.name != null && speaker.company.name.length > 0) {
      return Text(
        speaker.company.name,
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Image(
              image: speaker.photo,
              height: 48.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildSpeakerName(),
                buildSpeakerCompany(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
