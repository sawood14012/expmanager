import 'dart:io';

import 'package:expmanager/switch.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show Image;

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Login extends ConsumerStatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  var _passwordVisible;
  late final GlobalKey<FormState> _formKey;
  bool? Rememberme = false;
  final textFieldFocusNode = FocusNode();
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();

  @override
  @override
  void initState() {
    super.initState();
    _passwordVisible = true;
    _formKey = GlobalKey<FormState>();
  }

  void _togglePasswordStatus() {
    setState(() {
      _passwordVisible = !_passwordVisible;
      if (textFieldFocusNode.hasPrimaryFocus)
        return; // If focus is on text field, dont unfocus
      textFieldFocusNode.canRequestFocus =
          false; // Prevents focus if tap on eye
    });
  }

  void _submit() {
    //Todo login
    ref.read(LoginStateProvider.state).state = true;
  }

  void _forgotPassword() {
    //forgot passworde
  }

  bool isValidEmail(email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.fromLTRB(0, 120, 0, 20),
                child: Image(image: AssetImage('assets/images/deepcloud.png'))),
            Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: emailcontroller,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          filled: true,
                          isDense: true, // Reduces height a bit
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none, // No border
                            borderRadius: BorderRadius.circular(
                                12), // Apply corner radius
                          ),
                          prefixIcon: const Icon(Icons.mail_rounded, size: 24)),
                      validator: (String? value) =>
                          isValidEmail(value) ? null : "Check your email",
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: passwordcontroller,
                      focusNode: textFieldFocusNode,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: _passwordVisible,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        hintText: 'Enter your password',
                        filled: true,
                        isDense: true, // Reduces height a bit
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none, // No border
                          borderRadius:
                              BorderRadius.circular(12), // Apply corner radius
                        ),
                        prefixIcon: Icon(Icons.lock_rounded, size: 24),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: GestureDetector(
                            onTap: _togglePasswordStatus,
                            child: Icon(
                              _passwordVisible
                                  ? Icons.visibility_rounded
                                  : Icons.visibility_off_rounded,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Checkbox(
                            value: Rememberme,
                            onChanged: (bool? value) {
                              setState(() {
                                Rememberme = value;
                              });
                            }),
                        const Text("Remember me?"),
                        const SizedBox(width: 25),
                        GestureDetector(
                            onTap: _forgotPassword,
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            )),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                        width: double.infinity, // <-- match_parent
                        child: ElevatedButton(
                          onPressed: _submit,
                          child: const Text("Login"),
                        ))
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: CustomPaint(
                    size: Size(MediaQuery.of(context).size.width,
                        MediaQuery.of(context).size.height * 0.5),
                    painter: CurvedPainter(),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Container(
                        child: const Image(
                            image: AssetImage('assets/images/ff.png')),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      //..color = const Color(0xff469FD1)
      ..color = Colors.blue
      ..strokeWidth = 15
      ..style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(size.width, size.height * 0.4210456);
    path.cubicTo(
        size.width * 0.8892633,
        size.height * 0.5911293,
        size.width * 0.6985628,
        size.height * 0.7034221,
        size.width * 0.4818841,
        size.height * 0.7034221);
    path.cubicTo(
        size.width * 0.2872536,
        size.height * 0.7034221,
        size.width * 0.1135838,
        size.height * 0.6128213,
        0,
        size.height * 0.4711179);
    path.lineTo(0, size.height * 1.250951);
    path.lineTo(size.width, size.height * 1.250951);
    path.lineTo(size.width, size.height * 0.4210456);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
