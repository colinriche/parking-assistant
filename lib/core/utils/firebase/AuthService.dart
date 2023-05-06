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
        'isVisited_Parking': false,
        'address': '',
        'latitude': 0.00,
        'longitude': 0.00,
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

  Future<List<Map<String, dynamic>>> getParkingLocations() async {
    DatabaseReference geofenceRef =
    FirebaseDatabase.instance.reference().child('parking_locations');
    List<Map<String, dynamic>> newGeofences = [];
    // Retrieve geofence locations from Firebase Realtime Database
    geofenceRef.onValue.listen((event) {
      Map<dynamic, dynamic> geofencesMap = event.snapshot.value as Map<dynamic, dynamic>;
      if (geofencesMap != null) {
        geofencesMap.forEach((key, value) {
          Map<String, dynamic> geofence = Map.from(value);
          newGeofences.add(geofence);

        });
      }
    });

    return newGeofences;
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