import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:solar/firebase_options.dart';

abstract class FirebaseFactory {
  Future<void> initFirebase();
  // FirebaseAuth getFirebaseAuth();
  FirebaseFirestore getFirebaseFirestore();
}

class FirebaseFactoryImpl implements FirebaseFactory {
  // FirebaseAuth? _firebaseAuth;
  FirebaseFirestore? _firebaseFirestore;

  //* init Firebase
  @override
  Future<void> initFirebase() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
      // const FirebaseOptions(
      //   apiKey: "AIzaSyAnpaYRtcz7zobom77EnsO2ZfhgBueTErs",
      //   authDomain: "may-fair-17051.firebaseapp.com",
      //   projectId: "may-fair-17051",
      //   storageBucket: "may-fair-17051.appspot.com",
      //   messagingSenderId: "444760830252",
      //   appId: "1:444760830252:web:c5c055e0f5f114776ebc89",
      //   measurementId: "G-ERJCJJWVC2",
      // ),
    ).then((value) {
      print("init Firebase");
    });
  }

//* get Firebase Auth
  // @override
  // FirebaseAuth getFirebaseAuth() {
  //   if (_firebaseAuth == null) {
  //     print('>>>>>>>>>>>>>>>>> firebaseAuth is null<<<<<<<<<<<<<<<<<<<');
  //     return _firebaseAuth = FirebaseAuth.instance;
  //   } else {
  //     print('>>>>>>>>>>>>>>>>> firebaseAuth have a value <<<<<<<<<<<<<<<<<<<');
  //     return _firebaseAuth!;
  //   }
  // }

//* get Firebase Firestore
  @override
  FirebaseFirestore getFirebaseFirestore() {
    if (_firebaseFirestore == null) {
      print('>>>>>>>>>>>>>>>>> firebaseFirestore is null<<<<<<<<<<<<<<<<<<<');

      return _firebaseFirestore = FirebaseFirestore.instance;
    } else {
      print(
          '>>>>>>>>>>>>>>>>> firebaseFirestore have a value <<<<<<<<<<<<<<<<<<<');
      return _firebaseFirestore!;
    }
  }
}