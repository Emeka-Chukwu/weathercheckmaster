import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class AuthService {
  FirebaseAuth userAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<User?> signInUser(String email, String password) async {
    User? firebaseUser;
    try {
      firebaseUser = (await FirebaseAuth.instance
              .signInWithEmailAndPassword(email: email, password: password))
          .user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
    }
  }

  static getCurrentLocationOfUser() async {}

  Future<Map<String, dynamic>> getUserLocationTemp() async {
    // api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String key = "848d86e37f4c451bbba655efdc5c151b";
    http.Client client = http.Client();
    var url = Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.latitude}&appid=$key');
    try {
      var response = await client.get(url);
      print(json.decode(response.body));
      return json.decode(response.body);
    } catch (e) {
      print(e);
      return {
        "message": e.toString(),
      };
    }
  }
}
