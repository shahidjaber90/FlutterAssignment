import 'package:flutter/material.dart';
import 'package:flutter_assignment/utils/colors.dart';
import 'package:flutter_assignment/utils/text.dart';
import 'package:flutter_assignment/widget/textfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TextConstants.profileText,
          style: TextStyle(color: ColorConstants.textColor),
        ),
        backgroundColor: ColorConstants.primaryColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: ColorConstants.textColor,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
        child: GestureDetector(
          onTap: () {},
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: ColorConstants.orColor.withOpacity(0.1)),
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              image: AssetImage('assets/profile.jpg'))),
                    ),
                    Positioned(
                        bottom: 5,
                        right: 0,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: ColorConstants.editColor,
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          child: Icon(
                            Icons.edit,
                            color: ColorConstants.primaryColor,
                          ),
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 40.0,),

              buildTextField('Full Name',null),
              buildTextField('Nick Name', null),
              buildTextField('Date of Birth',const Icon(Icons.date_range)),
              buildTextField('Email',const Icon(Icons.email)),
              buildTextField('Gender',const Icon(Icons.arrow_drop_down)),

              const SizedBox(height: 30,),

               Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
          ),
        ),
        child: Text(
          TextConstants.continueText,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: ColorConstants.primaryColor),
        ),
      )),

            ],
          ),
        ),
      ),
    );
  }
}
