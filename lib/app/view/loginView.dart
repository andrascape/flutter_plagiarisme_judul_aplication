import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:plagiarisme_app/app/theme/themeData.dart';

class LoginPagee extends StatefulWidget {
  LoginPagee({super.key});

  @override
  State<LoginPagee> createState() => _LoginPageeState();
}

class _LoginPageeState extends State<LoginPagee> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    double heightDevice = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(widthDevice * 0.05),
        child: ListView(
          children: [
            SizedBox(
              height: heightDevice * 0.05,
            ),
            Container(
              height: 300,
              child: Image.asset("assets/images/login.jpg"),
            ),
            const Text("Nama Pengguna"),
            SizedBox(
              height: heightDevice * 0.01,
            ),
            LoginInput(
              hintText: 'Masukkan Nama Pengguna',
              prefixIcon: const Icon(Icons.person),
              controller: username,
            ),
            SizedBox(
              height: heightDevice * 0.04,
            ),
            const Text("Kata Sandi"),
            SizedBox(
              height: heightDevice * 0.01,
            ),
            LoginInput(
              hintText: 'Masukkan Kata Sandi',
              prefixIcon: const Icon(Icons.lock),
              controller: password,
            ),
            SizedBox(
              height: heightDevice * 0.06,
            ),
            ElevatedButton(
              onPressed: () {
                _doLogin();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: PrimaryColor,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Masuk"),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                  text: "Belum Punya Akun? ",
                  style: const TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Daftar Sekarang",
                      style: const TextStyle(color: PrimaryColor),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future _doLogin() async {
    if (username.text.isEmpty || password.text.isEmpty) {
      Alert(
        context: context,
        title: "LOGIN GAGAL",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "OK",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ).show();
      return;
    }
  }
}

class LoginInput extends StatelessWidget {
  final String hintText;
  final Widget prefixIcon;
  TextEditingController controller = TextEditingController();

  LoginInput({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: PrimaryColor),
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
