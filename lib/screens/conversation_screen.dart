import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_v2/components/chat/ChatComposer.dart';
import 'package:flutter_chat_v2/components/common/ReusableChatArea.dart';
import 'package:flutter_chat_v2/components/common/UserStatus.dart';
import 'package:flutter_chat_v2/constants/language/index.dart';
import 'package:flutter_chat_v2/constants/mock/conversation.dart';

enum ChatBubblePosition { first, middle, last }

class ConversationScreen extends StatefulWidget {
  final Conversation conversation;
  ConversationScreen({Key key, @required this.conversation}) : super(key: key);

  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic languageJumbotron =
        Language.of(context).currentLanguagePack.jumbotron;
    String formattedStatus = widget.conversation.participants.first.status
        .toString()
        .replaceAll("UserStatus.", "");

    Widget _getStatusUI(UserStatus status) {
      return Container(
        margin: EdgeInsets.only(top: 2, left: 3),
        width: 12,
        height: 12,
        decoration: BoxDecoration(
            color: colorByStatus(status),
            shape: BoxShape.circle,
            border:
                Border.all(color: Theme.of(context).primaryColor, width: 2)),
      );
    }

    Widget _getAppBar() {
      return AppBar(
        title: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      widget.conversation.participants.first.imageURL),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.conversation.participants.first.name),
                  Row(
                    children: [
                      Text(
                        languageJumbotron["status-$formattedStatus"],
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      _getStatusUI(
                          widget.conversation.participants.first.status)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        centerTitle: false,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            print("Current Avatar tapped!");
          },
          child: Container(
              margin: EdgeInsets.only(top: 10, left: 13, bottom: 10, right: 13),
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  })),
        ),
        actions: [
          IconButton(icon: Icon(Icons.call), onPressed: () {}),
          IconButton(
            icon: Icon(CupertinoIcons.video_camera_solid),
            onPressed: () {},
            iconSize: 32,
          )
        ],
      );
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        resizeToAvoidBottomPadding: false,
        backgroundColor: Theme.of(context).primaryColor,
        appBar: _getAppBar(),
        body: Container(
          child: Column(
            children: [
              ReusableChatArea(
                  conversationMessages: widget.conversation.messages),
              ChatComposer()
            ],
          ),
        ));
  }
}
