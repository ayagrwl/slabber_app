import 'User.dart';
import 'SocketUtils.dart';

class G {
  // Socket
  static SocketUtils socketUtils;
  static List<User> dummyUsers;

  // Logged In User
  static User loggedInUser;

  // Single Chat - To Chat User
  static User toChatUser;

  static initSocket() {
    if (null == socketUtils) {
      socketUtils = SocketUtils();
    }
  }
    
  static void initDummyUsers() {
    User harshOnePlus = new User(id: 1, name: 'Harsh 1+', email: '1@gmail.com');
    User harshMoto = new User(id: 2, name: 'Harsh moto', email: '2@gmail.com');
    User ayushEmul = new User(id: 3, name: 'Ayush emul', email: '3@gmail.com');
    User ayushPhone = new User(id: 4, name: 'Ayush phone', email: '4@gmail.com');
    dummyUsers = List<User>();
    dummyUsers.add(harshOnePlus);
    dummyUsers.add(harshMoto);
    dummyUsers.add(ayushEmul);
    dummyUsers.add(ayushPhone);
  }

  static List<User> getUsersFor(User user) {
    List<User> filteredUsers = dummyUsers
        .where((u) => (!u.name.toLowerCase().contains(user.name.toLowerCase())))
        .toList();
    return filteredUsers;
  }
}