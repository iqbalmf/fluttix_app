part of 'models.dart';

class RegistrationData {
  String name;
  String email;
  String password;
  String selectedLang;
  List<String> selectedGenres;
  File profileImage;

  RegistrationData(
      {this.name = "",
      this.email = "",
      this.password = "",
      this.selectedGenres = const [],
      this.selectedLang = "",
      this.profileImage});

  @override
  String toString() {
    // TODO: implement toString
    return "[$name] - [$email] - [$password]";
  }
}
