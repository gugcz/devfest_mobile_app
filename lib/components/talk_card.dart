import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/topic.dart';
import 'package:devfest_mobile_app/components/talk_speaker_info.dart';

class TalkCard extends StatelessWidget {
  final String talkName;
  final String firstSubtitle;
  final String secondSubtitle;
  final List<Topic> topics;
  final Image speakerPhoto;
  final String speakerName;
  final String company;

  TalkCard({
    Key key,
    @required this.talkName,
    this.firstSubtitle,
    this.secondSubtitle,
    this.topics,
    @required this.speakerPhoto,
    @required this.speakerName,
    this.company,
  }) : super(key: key);

  Widget buildTalkName() {
    return Text(
      talkName,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
    );
  }

  Widget buildFirstSubtitle() {
    if (firstSubtitle != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
        child: Text(
          firstSubtitle,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildSecondSubtitle() {
    if (secondSubtitle != null) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
        child: Text(
          secondSubtitle,
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget buildTopics() {
    if (topics != null && topics.length > 0) {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 6, 0, 0),
        child: Row(
          children: topics,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
            TalkSpeakerInfo(
              speakerPhoto: speakerPhoto,
              speakerName: speakerName,
              company: company,
            ),
          ],
        ),
      ),
    );
  }
}
