import 'dart:convert';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:clothing_measurement/api/api.dart';
import 'package:clothing_measurement/model/user.dart';
=======
import 'package:getx_mysql_tutorial/api/api.dart';
import 'package:getx_mysql_tutorial/model/user.dart';
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  var formKey = GlobalKey<FormState>();

  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  checkUserEmail() async {
    try {
      var response = await http.post(Uri.parse(API.validateEmail),
          body: {'user_email': emailController.text.trim()});

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['existEmail'] == true) {
          Fluttertoast.showToast(
<<<<<<< HEAD
            msg: "이미 가입된 이메일입니다.",
=======
            msg: "Email is already in use. Please try another email",
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
          );
        }else{
          saveInfo();
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  saveInfo() async {
    User userModel = User(1, userNameController.text.trim(),
        emailController.text.trim(), passwordController.text.trim());

    try {
      var res = await http.post(
        Uri.parse(API.signup),
        body: userModel.toJson()
      );

      if(res.statusCode == 200){
        var resSignup = jsonDecode(res.body);
        if(resSignup['success'] == true){
<<<<<<< HEAD
          Fluttertoast.showToast(msg: '회원가입 성공');
=======
          Fluttertoast.showToast(msg: 'Signup successfully');
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
          setState(() {
            userNameController.clear();
            emailController.clear();
            passwordController.clear();
          });
        }else{
<<<<<<< HEAD
          Fluttertoast.showToast(msg: '다시 시도 해주세요');
=======
          Fluttertoast.showToast(msg: 'Error occurred. Please try again');
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
                Icon(
                  Icons.card_travel_outlined,
                  color: Colors.deepPurple,
                  size: 100,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
<<<<<<< HEAD
                  '회원가입',
=======
                  'Sign Up',
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                  style: GoogleFonts.bebasNeue(fontSize: 36.0),
                ),
                SizedBox(
                  height: 10,
                ),
<<<<<<< HEAD
                Text('Thank you for join!',
=======
                Text('Thank you for join us',
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                    style: GoogleFonts.bebasNeue(fontSize: 28)),
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
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: userNameController,
                              validator: (val) =>
<<<<<<< HEAD
                                  val == "" ? "이름을 입력해주세요 " : null,
=======
                                  val == "" ? "Please enter username " : null,
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'User'),
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
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (val) =>
<<<<<<< HEAD
                                  val == "" ? "이메일 입력" : null,
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
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (val) =>
<<<<<<< HEAD
                                  val == "" ? "비밀번호를 입력해주세요" : null,
=======
                                  val == "" ? "Please enter password" : null,
>>>>>>> 6a755e9cd1e090f561b23bd2ea33cc319da8c104
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password'),
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
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      checkUserEmail();
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
                            '회원가입',
=======
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            'Sign up',
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
                    Text('이미 회원가입을 하셨나요?'),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        ' 로그인 페이지',
=======
                    Text('Already registered?'),
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Text(
                        ' Go back Login page!',
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
