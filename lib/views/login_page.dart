import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/colors.dart';
import 'package:flutter_assignment/utils/text.dart';
import 'package:flutter_assignment/views/profile_page.dart';
import 'package:flutter_assignment/widget/buttonWidget.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _obsecureText = true;

  login() {
    if (email.text == 'admin@gmail.com' && password.text == '123456') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfilePage()),
      );
    } else {
      setState(() {
        TextConstants.loginErrorText = 'Login failed';
        showDialog(
            context: context,
            builder: (context) {
              return Container(
                child: AlertDialog(
                  title: const Text('Login Failed'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    )
                  ],
                ),
              );
            });
      });
    }
  }

  late Box box1;

  @override
  void initState() {
    super.initState();
    createBox();
  }

  void createBox() async {
    box1 = await Hive.openBox('logindata');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: ColorConstants.textColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Container(
                height: 200,
                color: ColorConstants.primaryColor,
                child: const Image(
                  image: AssetImage(
                    'assets/vector.png',
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      TextConstants.loginText,
                      style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.textColor),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          labelText: TextConstants.emailText,
                          prefixIcon: const Icon(Icons.email)),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    TextField(
                      controller: password,
                      obscureText: _obsecureText,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              _obsecureText = !_obsecureText;
                            });
                          },
                          child: Icon(_obsecureText
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        filled: true,
                        border: InputBorder.none,
                        labelText: TextConstants.passwordText,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              isChecked = !isChecked;
                              setState(() {});
                            }),
                        Text(
                          TextConstants.rememberMeText,
                          style: TextStyle(
                              color: ColorConstants.textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                        width: double.infinity,
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        child: ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0)),
                            ),
                          ),
                          child: Text(
                            TextConstants.signInText,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: ColorConstants.primaryColor),
                          ),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          TextConstants.forgotText,
                          style: TextStyle(
                              color: ColorConstants.signupColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        )),
                    Text(
                      TextConstants.continueWithText,
                      style: TextStyle(
                          color: ColorConstants.orColor, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: buttonLoginFunction('assets/facebook.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: buttonLoginFunction('assets/google.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: buttonLoginFunction('assets/apple.png'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          TextConstants.accountText,
                          style: TextStyle(color: ColorConstants.orColor),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 5.0),
                        //   child:
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              TextConstants.signupText,
                              style: TextStyle(
                                  color: ColorConstants.signupColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                        // ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
