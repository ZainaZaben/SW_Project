import './user_model.dart';

class Message {
  late final User sender;
  final String avatar;
  final String time;
  final int unreadCount;
  final bool isRead;
  final String text;

  Message({
    required this.sender,
    required this.avatar,
    required this.time,
    required this.unreadCount,
    required this.text,
    required this.isRead,
  });
}

final List<Message> recentChats = [
  Message(
    sender: addison,
    avatar: 'assets/chats/Addison.jpg',
    time: '01:25',
    text: "typing...",
    unreadCount: 1,
    isRead: false,
  ),
  Message(
    sender: jason,
    avatar: 'assets/chats/Jason.jpg',
    time: '12:46',
    text: "Will I be in it?",
    unreadCount: 1,
    isRead: false,
  ),
  Message(
    sender: deanna,
    avatar: 'assets/chats/Deanna.jpg',
    time: '05:26',
    text: "That's so cute.",
    unreadCount: 3,
    isRead: false,
  ),
  Message(
      sender: nathan,
      avatar: 'assets/chats/Nathan.jpg',
      time: '12:45',
      text: "Let me see what I can do.",
      unreadCount: 2,
      isRead: false),
];

final List<Message> allChats = [
  Message(
    sender: virgil,
    avatar: 'assets/chats/Virgil.jpg',
    time: '12:59',
    text: "No! I just wanted",
    unreadCount: 0,
    isRead: true,
  ),
  Message(
    sender: stanley,
    avatar: 'assets/chats/Stanley.jpg',
    time: '10:41',
    text: "You did what?",
    unreadCount: 1,
    isRead: false,
  ),
  Message(
    sender: leslie,
    avatar: 'assets/chats/Leslie.jpg',
    time: '05:51',
    unreadCount: 0,
    isRead: true,
    text: "just signed up for a tutor",
  ),
  Message(
    sender: judd,
    avatar: 'assets/chats/Judd.jpg',
    time: '10:16',
    text: "May I ask you something?",
    unreadCount: 2,
    isRead: false,
  ),
];

final List<Message> messages = [
  Message(
    sender: addison,
    time: '12:09 AM',
    avatar: addison.avatar,
    text: "...",
    isRead: true,
    unreadCount: 0,
  ),
  Message(
    sender: currentUser,
    time: '12:05 AM',
    isRead: true,
    text: "I’m going home.",
    unreadCount: 0,
    avatar: '',
  ),
  Message(
    sender: currentUser,
    time: '12:05 AM',
    isRead: true,
    text: "See, I was right, this doesn’t interest me.",
    avatar: '',
    unreadCount: 0,
  ),
  Message(
    sender: addison,
    time: '11:58 PM',
    avatar: addison.avatar,
    text: "I sign your paychecks.",
    isRead: true,
    unreadCount: 0,
  ),
  Message(
    sender: addison,
    time: '11:58 PM',
    avatar: addison.avatar,
    text: "You think we have nothing to talk about?",
    unreadCount: 0,
    isRead: true,
  ),
  Message(
    sender: currentUser,
    time: '11:45 PM',
    isRead: true,
    text:
        "Well, because I had no intention of being in your office. 20 minutes ago",
    avatar: '',
    unreadCount: 0,
  ),
  Message(
    sender: addison,
    time: '11:30 PM',
    avatar: addison.avatar,
    text: "I was expecting you in my office 20 minutes ago.",
    unreadCount: 0,
    isRead: true,
  ),
];
