import 'package:flutter/material.dart';
import 'package:fluttix_app/services/services.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(), builder: (context, snapshot) {
          if(snapshot.hasError){
            print(snapshot.error);
          }
          if(snapshot.connectionState == ConnectionState.done){
            return InitWidget();
          }
          return CircularProgressIndicator();
    });
  }
}

class InitWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fluttix'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    SignInSignUpResult result = await AuthServices.signUp(
                        "iqbalmf68@gmail.com",
                        "123456",
                        "Iqbal M Fauzan",
                        ["Action", "Drama", "Horror", "Comedy"],
                        "Indonesian");

                    if (result.user == null) {
                      print(result.message);
                    } else {
                      print(result.user.toString());
                    }
                  },
                  child: Text('Sign Up'))
            ],
          ),
        ),
      ),
    );
  }
}
