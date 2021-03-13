part of 'extensions.dart';

extension FirebaseUserExtension on User {
  Users convertToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguages = "Sundanese",
          int balance = 50000}) =>
      Users(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguages: selectedLanguages);
}
