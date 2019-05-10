import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/talk_speaker_info.dart';
import 'package:devfest_mobile_app/screens/talk_detail_screen.dart';
import 'package:devfest_mobile_app/entities/talk.dart';

class TalkCard extends StatelessWidget {
  final Talk talk;

  TalkCard({
    Key key,
    @required this.talk,
  }) : super(key: key);

  Widget buildTalkName() {
    return Text(
      talk.name,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
    );
  }

  Widget buildFirstSubtitle() {
    if (talk.firstSubtitle != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
        child: Text(
          talk.firstSubtitle,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildSecondSubtitle() {
    if (talk.secondSubtitle != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
        child: Text(
          talk.secondSubtitle,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildTopics() {
    if (talk.topics != null && talk.topics.length > 0) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
        child: Row(
          children: talk.topics,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TalkDetailScreen(talk: talk),
              ),
            );
          },
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildTalkName(),
                buildFirstSubtitle(),
                buildSecondSubtitle(),
                buildTopics(),
                TalkSpeakerInfo(speaker: talk.speaker),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
