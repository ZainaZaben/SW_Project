import 'package:flutter/material.dart';
import 'package:flutter_project_1st/chatpage/message_model.dart';

class RecentChats extends StatelessWidget {
  const RecentChats({
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
                'Recent Chats',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Icon(Icons.search)
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemCount: recentChats.length,
            itemBuilder: (contex, int index) {
              final recentChat = recentChats[index];
              return Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage(recentChats[index].avatar),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(recentChat.sender.name,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          Text(recentChat.text,
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
                          CircleAvatar(
                              radius: 8,
                              backgroundColor: Color(0xFF33c787),
                              child: Text(
                                recentChat.unreadCount.toString(),
                                style: TextStyle(
                                    color: Color(0xFFffffff),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text(recentChat.time,
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
