import 'package:flutter/material.dart';

class TalkSpeakerInfo extends StatelessWidget {
  final Image speakerPhoto;
  final String speakerName;
  final String company;

  TalkSpeakerInfo({
    Key key,
    @required this.speakerPhoto,
    @required this.speakerName,
    this.company,
  }) : super(key: key);

  Widget buildSpeakerName() {
    return Text(
      speakerName,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 18,
      ),
    );
  }

  Widget buildSpeakerCompany() {
    if (company.length > 0) {
      return Text(
        company,
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
            child: speakerPhoto,
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
