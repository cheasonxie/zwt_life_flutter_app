import 'package:flutter/material.dart';
import 'package:zwt_life_flutter_app/common/widgets/messagewidget/ChatUser.dart';

class ChatMessageListItem extends StatelessWidget {
  final Animation animation;
  final ChatUser chatUser;

  ChatMessageListItem({this.animation, this.chatUser});

  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor:
          new CurvedAnimation(parent: animation, curve: Curves.decelerate),
      child: new Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: new Row(
          children: chatUser.userId == "1076820548"
              ? getSentMessageLayout()
              : getReceivedMessageLayout(),
        ),
      ),
    );
  }

  List<Widget> getSentMessageLayout() {
    return <Widget>[
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TabUserName(chatUser: chatUser),
            new Container(
              child: TabConversationBubble(
                chatUser: chatUser,
              ),
            ),
          ],
        ),
      ),
      new Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: TabUserIcon(
                chatUser: chatUser,
              )),
        ],
      ),
    ];
  }

  List<Widget> getReceivedMessageLayout() {
    return <Widget>[
      new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
              margin: const EdgeInsets.only(right: 8.0),
              child: TabUserIcon(
                chatUser: chatUser,
              )),
        ],
      ),
      new Expanded(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TabUserName(chatUser: chatUser),
            Container(
              child: TabConversationBubble(
                chatUser: chatUser,
              ),
            ),
          ],
        ),
      ),
    ];
  }
}

//泡沫的内容
class TabUserChatContent extends StatelessWidget {
  final ChatUser chatUser;

  const TabUserChatContent({Key key, @required this.chatUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (chatUser.chatData.ImageUrl != null &&
        chatUser.chatData.ImageUrl.length > 0) {
      return Image.network(
        chatUser.chatData.ImageUrl,
        width: 250.0,
      );
    } else {
      return Text(
        chatUser.chatData.text,
        style: TextStyle(
          color: Colors.black,
          letterSpacing: -0.4,
          fontSize: 15.0,
          fontWeight: FontWeight.w600,
        ),
      );
    }
  }
}

//用户头像
class TabUserIcon extends StatelessWidget {
  final ChatUser chatUser;

  const TabUserIcon({Key key, @required this.chatUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      backgroundImage: new NetworkImage(chatUser.userIconUrl),
    );
    return null;
  }
}

//用户名
class TabUserName extends StatelessWidget {
  final ChatUser chatUser;

  const TabUserName({Key key, @required this.chatUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(chatUser.userName,
          style: new TextStyle(
            fontSize: 12.0,
          )),
    );
  }
}

//泡沫
class TabConversationBubble extends StatelessWidget {
  final ChatUser chatUser;

  const TabConversationBubble({Key key, @required this.chatUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
      child: TabUserChatContent(
        chatUser: chatUser,
      ),
    );
  }
}