import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.reference();
  // Sign up with email and password
  Future<String?> signUp(String email, String password, String name) async {
    try {
      // Create a new user account using Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the user ID from Firebase Authentication
      String uid = userCredential.user!.uid;

      // Store the user data in the Firebase Realtime Database
      await databaseReference.child('users').child(uid).set({
        'name': name,
        'email': email,
      });

      // Return the user ID
      return uid;
    } catch (e) {
      print(e);
      return null;
    }
  }

  // Login with email and password
  Future<String?> loginWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

    // Future<List<Map<String, dynamic>>> getParkingLocations() async {
    //   DatabaseReference starCountRef =
    //   FirebaseDatabase.instance.ref('parking_locations');
    //   List<Map<String, dynamic>> parkingLocations = [];
    //
    //   starCountRef.onValue.listen((event) {
    //     final data = event.snapshot.value;
    //     if (data != null) {
    //       Object? values = data;
    //       print(values);
    //     }
    //   });
    //
    //   await Future.delayed(Duration(seconds: 1)); // Wait for the data to load
    //   return parkingLocations;
    // }

  Future<List<Map<String, dynamic>>> getParkingLocations() async {
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref('parking_locations');
    List<Map<String, dynamic>> parkingLocations = [];

    try {
      starCountRef.onValue.listen((event) {
        DataSnapshot snapshot = event.snapshot;
        Map<dynamic, dynamic>? values = snapshot.value as Map?;

        if (values != null) {
          values.forEach((key, item) {

            if (item is Map<String, dynamic>) {
              print(item);
           //   parkingLocations.add(item);
            }
          });
        }
      });
    } catch (error) {
      print(error);
    }

    return parkingLocations;
  }





  // Sign out
  Future<void> signOut() async {
    return _auth.signOut();
  }

  Future<bool> islogin() async {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }
}