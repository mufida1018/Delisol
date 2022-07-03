import 'dart:convert';
import 'package:delisol/Screens/home_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Post {
  final String email;
  final String password;

  Post({required this.email, required this.password});

  factory Post.fromJson(Map json) {
    return Post(
      email: json['email'],
      password: json['password'],
    );
  }

  Map toMap() {
    var map = new Map();
    map["email"] = email;
    map["password"] = password;

    return map;
  }
}


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool obscureText = true;

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final formkey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.4,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/loginscreenvector.png'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Let's Sign you in.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 10),
                child: Text(
                  "Welcome Back.",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "You have been missed!",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    // hintText: 'Email',
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    suffixIcon: emailController.text.isEmpty
                        ? Container(
                      width: 0,
                    )
                        : IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        emailController.clear();
                      },
                    ),
                    //email input decoration
                  ),
                  keyboardType: TextInputType.emailAddress,
                  autofillHints: [AutofillHints.email],
                  validator: (email) =>
                  email != null && !EmailValidator.validate(email)
                      ? 'Enter a valid email'
                      : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextFormField(
                  //password
                  obscureText: obscureText,
                  obscuringCharacter: '*',
                  controller: passwordController,
                  decoration: InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: GestureDetector(
                      child: Icon(Icons.remove_red_eye),
                      onLongPress: () {
                        obscureText = false;
                        setState(() {});
                      },
                      onLongPressUp: () {
                        obscureText = true;
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      "Recover Password",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Sing Up",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.orange[300]),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20),
                child: GestureDetector(
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      color: Colors.orange[300],
                    ),
                  ),
                  onTap: () async {
                    String email = emailController.text.toString();
                    String password = passwordController.text.toString();
                    _getDistance(email, password);
                    // Post newPost = new Post(
                    //     email: emailController.text,password: passwordController.text);
                    // Post p = await createPost(LOGIN_API,
                    //     params : newPost.toMap());
                    // setState(() {
                    //   Navigator.pushReplacement(context,
                    //       MaterialPageRoute(builder: (_) => HomeScreen(token: data['token'].toString(),)));
                    // });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<String> _getDistance(String email, password) async {
    final msg = jsonEncode({"email": email, "password": password});
    final response = await http.post(
      Uri.parse("https://app-dev-task.herokuapp.com/users/login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: msg,
    );
    print(response.body);
    var data = jsonDecode(response.body.toString());
    print(data['token'].toString());
    var token = data['token'].toString();
    setState(() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (_) => HomeScreen()));
    });
    return response.statusCode == 200
        ? jsonDecode(response.body).toString()
        : 'Failed to get distance';
  }
}