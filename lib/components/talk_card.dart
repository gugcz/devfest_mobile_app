import 'package:flutter/material.dart';
import 'package:devfest_mobile_app/components/topic.dart';
import 'package:devfest_mobile_app/components/talk_speaker_info.dart';
import 'package:devfest_mobile_app/screens/talk_detail_screen.dart';

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
    return Padding(
      padding: EdgeInsets.fromLTRB(6, 3, 6, 3),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TalkDetailScreen(
                      talkName: talkName,
                      firstSubtitle: firstSubtitle,
                      secondSubtitle: secondSubtitle,
                      topics: topics,
                      description:
                          "Flutter is a new mobile app SDK for iOS and Android. Do you know how it started and why? Do you know why it’s using Dart? Do you know how Flutter approaches multi-threading? Notches? Gestures? Layout? Animation? Accessibility? Testing? Profiling? Declarative programming? Do you know what “extreme composition over inheritance” means in Flutter parlance? Did you know that most of the code in Flutter SDK was written in 1842? (It’s true.) This talk is meant for both beginners who might want to know what this Flutter thing is all about, and for intermediate users, who might not know about some of the advanced topics. Flutter is a new mobile app SDK for iOS and Android. Do you know how it started and why? Do you know why it’s using Dart? Do you know how Flutter approaches multi-threading? Notches? Gestures? Layout? Animation? Accessibility? Testing? Profiling? Declarative programming? Do you know what “extreme composition over inheritance” means in Flutter parlance? Did you know that most of the code in Flutter SDK was written in 1842? (It’s true.) This talk is meant for both beginners who might want to know what this Flutter thing is all about, and for intermediate users, who might not know about some of the advanced topics.",
                      speakerPhoto: speakerPhoto,
                      speakerName: speakerName,
                      company: company,
                    ),
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
                TalkSpeakerInfo(
                  speakerPhoto: speakerPhoto,
                  speakerName: speakerName,
                  company: company,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
