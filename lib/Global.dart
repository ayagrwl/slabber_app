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
    // User userA = new User(id: 1000, name: 'A', email: 'testa@gmail.com');
    dummyUsers = List<User>();
    // dummyUsers.add(userA);
    
  }

  static List<User> getUsersFor(User user) {
    List<User> filteredUsers = dummyUsers
        .where((u) => (!u.name.toLowerCase().contains(user.name.toLowerCase())))
        .toList();
    return filteredUsers;
  }
}