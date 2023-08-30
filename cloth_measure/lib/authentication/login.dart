import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:clothing_measurement/authentication/signup.dart';
import 'package:clothing_measurement/pages/app.dart';
import 'package:clothing_measurement/user/user_pref.dart';
import 'package:shared_preferences/shared_preferences.dart';
=======
import 'package:getx_mysql_tutorial/authentication/signup.dart';
import 'package:getx_mysql_tutorial/pages/app.dart';
import 'package:getx_mysql_tutorial/user/user_pref.dart';
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../api/api.dart';
import '../model/user.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}
<<<<<<< HEAD
class User {
  final String username;
  final String token;

  User({required this.username, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      token: json['token'],
    );
  }
}
=======

>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
class _LoginPageState extends State<LoginPage> {

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  userLogin() async{
    try {
      var res = await http.post(
          Uri.parse(API.login),
          body: {
            'user_email' : emailController.text.trim(),
            'user_password' : passwordController.text.trim()
          });

      if(res.statusCode == 200){
        var resLogin = jsonDecode(res.body);
        if(resLogin['success'] == true){
<<<<<<< HEAD
          Fluttertoast.showToast(msg: '로그인 성공');
          User userInfo = User.fromJson(resLogin['userData']);

          //await RememberUser.saveRememberUserInfo(userInfo);
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('username', userInfo.username);
          await prefs.setString('token', userInfo.token);

=======
          Fluttertoast.showToast(msg: 'Login successfully');
          User userInfo = User.fromJson(resLogin['userData']);

          await RememberUser.saveRememberUserInfo(userInfo);
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104

          Get.to(App());

          setState(() {
            emailController.clear();
            passwordController.clear();
          });
        }else{
<<<<<<< HEAD
          Fluttertoast.showToast(msg: '이메일과 비밀번호를 확인하세요');
=======
          Fluttertoast.showToast(msg: 'Please check your email and password');
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.white,
=======
      backgroundColor: Colors.grey[300],
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
<<<<<<< HEAD
                Image.asset(
                  'assets/images/appicon.jpg',
                  width: 400,
                  height: 200,
                ),
                Text(
                  '환영합니다!',
=======
                Icon(
                  Icons.phone_android,
                  size: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Hello',
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                  style: GoogleFonts.bebasNeue(fontSize: 36.0),
                ),
                SizedBox(
                  height: 10,
                ),
<<<<<<< HEAD
=======
                Text(
                  'Welcome back',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
<<<<<<< HEAD
                            border: Border.all(color: Colors.white60),
=======
                            border: Border.all(color: Colors.white),
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (val) =>
<<<<<<< HEAD
                              val == "" ? "이메일을 작성하세요" : null,
=======
                              val == "" ? "Please enter email" : null,
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
<<<<<<< HEAD
                              border: Border.all(color: Colors.white60),
=======
                              border: Border.all(color: Colors.white),
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (val) =>
                              val == "" ? "Please enter password" : null,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Password'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: (){
                    if(formKey.currentState!.validate()){
                      userLogin();
                    }
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
<<<<<<< HEAD
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            '로그인',
=======
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Sign in',
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
<<<<<<< HEAD
                    Text('회원이 아니신가요?'),
                    GestureDetector(
                      onTap: () => Get.to(() => SignupPage()),
                      child: Text(
                        ' 회원가입',
=======
                    Text('Not a member?'),
                    GestureDetector(
                      onTap: () => Get.to(() => SignupPage()),
                      child: Text(
                        ' Register Now!',
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
