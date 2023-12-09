import 'package:flutter/material.dart';
import 'package:flutter_project_1st/chatpage/message_model.dart';

class AllChats extends StatelessWidget {
  const AllChats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 30),
          child: Row(
            children: [
              Text(
                'All Chats',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: allChats.length,
            itemBuilder: (contex, int index) {
              final allChat = allChats[index];
              return Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(allChat.avatar),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(allChat.sender.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          Text(allChat.text,
                              style: TextStyle(
                                  color: Color(0xFF000000).withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600)),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          allChat.unreadCount == 0
                              ? Icon(
                                  Icons.done_all,
                                  color: Color(0xFF000000).withOpacity(0.5),
                                )
                              : CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Color(0xFF33c787),
                                  child: Text(
                                    allChat.unreadCount.toString(),
                                    style: TextStyle(
                                        color: Color(0xFFffffff),
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold),
                                  )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(allChat.time,
                              style: TextStyle(
                                  color: Color(0xFF000000).withOpacity(0.7),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                    ],
                  ));
            })
      ],
    );
  }
}
