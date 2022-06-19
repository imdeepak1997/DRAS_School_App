// login_screen.dart
import 'dart:convert';

import 'package:dras_school/class_list.dart';
import 'package:dras_school/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:http/http.dart' as http;
// const users = const {
//   'deepak@gmail.com': '12345',
//   'hunter@gmail.com': 'hunter',
// };

class LoginScreen extends StatelessWidget {
  var users = {};
  Duration get loginTime => Duration(milliseconds: 100);

  Future getUserData() async {
    var res = await http
        .get(Uri.parse("https://imdeepak1997.github.io/csv/userList.json"));
    this.users = jsonDecode(res.body);
  }

  Future<String> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    // var output = "False";
    return Future.delayed(loginTime).then((_) {
      if (!this.users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (this.users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  // Future<String> _signupUser(SignupData data) {
  //   debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
  //   return Future.delayed(loginTime).then((_) {
  //     return null;
  //   });
  // }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    getUserData();
    return FlutterLogin(
      // title: 'SACE',
      logo: "assets/images/Budha.png",
      onLogin: _authUser,
      onSignup: (_) => Future(null),
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Dashboard(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      hideSignUpButton: true,
      
      loginAfterSignUp: false,
      // loginProviders: <LoginProvider>[
      //     LoginProvider(
      //       // icon: Icon(Icons.ac_unit),
      //       label: 'Google',
      //       callback: () async {
      //         debugPrint('start google sign in');
      //         await Future.delayed(loginTime);
      //         debugPrint('stop google sign in');              
      //         return null;
      //       },
      //     ),
      //     LoginProvider(
      //       // icon: FontAwesomeIcons.facebookF,
      //       label: 'Facebook',
      //       callback: () async {            
      //         debugPrint('start facebook sign in');
      //         await Future.delayed(loginTime);
      //         debugPrint('stop facebook sign in');              
      //         return null;
      //       },
      //     ),
      //     LoginProvider(
      //       // icon: FontAwesomeIcons.linkedinIn,
      //       label: "LinkedIn",
      //       callback: () async {         
      //         debugPrint('start linkdin sign in');
      //         await Future.delayed(loginTime);         
      //         debugPrint('stop linkdin sign in');              
      //         return null;
      //       },
      //     ),
      //     LoginProvider(
      //       // icon: FontAwesomeIcons.githubAlt,
      //       label: "GitHub",
      //       callback: () async {
      //         debugPrint('start github sign in');
      //         await Future.delayed(loginTime);
      //         debugPrint('stop github sign in');              
      //         return null;
      //       },
      //     ),
      //   ],
      
    );
  }
}
