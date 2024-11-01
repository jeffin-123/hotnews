// import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:hot_news/home_page.dart';
import 'package:hot_news/widgets/textbutton_widget.dart';
import 'package:hot_news/widgets/textfield_widget.dart';
import 'package:hot_news/widgets/texts_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Center(
                child: CircleAvatar(
                  radius: 90,
                  backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 5, bottom: 5, right: 5, left: 5),
                    child: Image.asset("lib/assets/images/news image 2.png"),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              width: 420,
              height: 562,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                ),
              ),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: TextsWidgets(
                      texts: "LogIn",
                      color: Colors.black,
                      size: 45,
                      weight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 25, left: 20, right: 20),
                    child: TextFieldWidget(
                      borderColor: Colors.black,
                      hintText: "Enter mobile number",
                      color: Colors.black,
                      textInputType: TextInputType.phone,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      height: 70,
                      width: 380,
                      child: TextbuttonWidget(
                        text: "Login",
                        size: 25,
                        color: Colors.white,
                        isLoading: isLoading,
                        buttonStyle: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
