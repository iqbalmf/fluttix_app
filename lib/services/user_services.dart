part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(Users user) async {
    String genres = "";

    for (var genre in user.selectedGenres) {
      genres += genre + ((genre != user.selectedGenres.last) ? ',' : '');
    }

    _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': genres,
      'profilPicture': user.profilPicture ?? "",
      'selectedLanguages': user.selectedLanguages,
    });
  }

  static Future<Users> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();
    List<String> genres = snapshot.data()['selectedGenres'].split(',');

    return Users(id, snapshot.data()['email'],
        name: snapshot.data()['name'],
        profilPicture: snapshot.data()['profilPicture'],
        selectedGenres: genres,
        selectedLanguages: snapshot.data()['selectedLanguages'],
        balance: snapshot.data()['balance']);
  }
}
