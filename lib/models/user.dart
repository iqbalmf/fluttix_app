part of 'models.dart';

class Users extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilPicture;
  final List<String> selectedGenres;
  final String selectedLanguages;
  final int balance;

  Users(this.id, this.email,
      {this.name,
      this.profilPicture,
      this.selectedGenres,
      this.selectedLanguages,
      this.balance});

  @override
  String toString() {
    // TODO: implement toString
    return "[$id] - [$name]";
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        id,
        email,
        name,
        profilPicture,
        selectedGenres,
        selectedLanguages,
        balance
      ];
}
