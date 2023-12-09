class User {
  final int id;
  final String name;
  final String avatar;

  User({
    required this.id,
    required this.name,
    required this.avatar,
  });
}

final User currentUser = User(id: 0, name: 'You', avatar: 'assets/chats/Addison.jpg');

final User addison = User(id: 1, name: 'Addison', avatar: 'assets/chats/Addison.jpg');

final User angel = User(id: 2, name: 'Angel', avatar: 'assets/chats/Angel.jpg');

final User deanna = User(id: 3, name: 'Deanna', avatar: 'assets/chats/Deanna.jpg');

final User jason = User(id: 4, name: 'Json', avatar: 'assets/chats/Jason.jpg');

final User judd = User(id: 5, name: 'Judd', avatar: 'assets/chats/Judd.jpg');

final User leslie = User(id: 6, name: 'Leslie', avatar: 'assets/chats/Leslie.jpg');

final User nathan = User(id: 7, name: 'Nathan', avatar: 'assets/chats/Nathan.jpg');

final User stanley = User(id: 8, name: 'Stanley', avatar: 'assets/chats/Stanley.jpg');

final User virgil = User(id: 9, name: 'Virgil', avatar: 'assets/chats/Virgil.jpg');
