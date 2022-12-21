import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/colors.dart';
import 'package:flutter_assignment/utils/text.dart';
import 'package:flutter_assignment/views/login_page.dart';
import 'package:flutter_assignment/widget/buttonWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.primaryColor,
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
                    'assets/wing.png',
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    TextConstants.headingText,
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: ColorConstants.textColor),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buttonFunction(
                      'assets/facebook.png', TextConstants.facebookText),
                  const SizedBox(
                    height: 12,
                  ),
                  buttonFunction('assets/google.png', TextConstants.googleText),
                  const SizedBox(
                    height: 12,
                  ),
                  buttonFunction('assets/apple.png', TextConstants.appleText),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'or',
                    style:
                        TextStyle(color: ColorConstants.orColor, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  
                  Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
        child: Text(
          TextConstants.signpasswordText,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConstants.primaryColor),
        ),
      )),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        TextConstants.accountText,
                        style: TextStyle(color: ColorConstants.orColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              TextConstants.signupText,
                              style: TextStyle(
                                  color: ColorConstants.signupColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

