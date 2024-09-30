abstract class Failure extends UserMassage {
  final String message;
  Failure(this.message) : super(message);
}

abstract class UserMassage {
  String userMassage;
  UserMassage(this.userMassage) {
    userMassage = userMassage.contains(": ")
        ? userMassage.split(": ")[0].trim()
        : userMassage;
  }
}
