import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/data.dart';
import 'package:flutter_chat_v2/container/chat/ChatScreenFlexibleSpaceArea.dart';
import 'package:flutter_chat_v2/screens/SettingScreen.dart';
import 'package:flutter_chat_v2/utils/stringFormatter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ChatScreenSliverAppBar extends StatelessWidget {
  const ChatScreenSliverAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
        Language.of(context, listen: true).currentLanguagePack.jumbotron;
    return SliverAppBar(
        floating: true,
        title: Text(
          titleCase(languageJumbotron["chat-screen-header"]),
          style: TextStyle(fontSize: 21),
        ),
        centerTitle: true,
        pinned: true,
        expandedHeight: 120,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext builder) => SettingScreen()));
          },
          child: Container(
            margin: EdgeInsets.only(top: 10, left: 13, bottom: 10),
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage(UserMockData().currentUser.imageURL),
            ),
          ),
        ),
        actions: [
          IconButton(
              icon: FaIcon(
                FontAwesomeIcons.github,
                size: 28,
              ),
              onPressed: () => {})
        ],
        flexibleSpace: ChatScreenFlexibleSpaceArea());
  }
}
