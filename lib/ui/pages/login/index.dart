import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:splitq/domain/models/index.dart';
import 'package:splitq/stores/index.dart';
import 'package:splitq/ui/styles/button.dart';
import 'package:splitq/ui/styles/text.dart';
import 'package:splitq/ui/theme/colors.dart';
import 'package:splitq/utils/index.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserStore userStore = Get.find<UserStore>();

  bool _passwordVisible = false;

  _login() {
    if (_emailIdController.text.trim().isEmpty) {
      Get.snackbar('Incomplete details', 'Email is required');
      return;
    } else if (!FormUtils.isEmailValid(_emailIdController.text)) {
      Get.snackbar('Incorrect details', 'Email entered is invalid');
      return;
    } else if (_passwordController.text.trim().isEmpty) {
      Get.snackbar('Incomplete details', 'Password is required');
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    userStore.login(_emailIdController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Image.asset(
                                'assets/images/bg_login.png',
                                width: 172,
                              ),
                            ),
                            Positioned(
                              top: 150,
                              right: 150,
                              child: SvgPicture.asset(
                                'assets/images/ic_plus.svg',
                              ),
                            ),
                            Positioned(
                              top: 170,
                              right: 125,
                              child: SvgPicture.asset(
                                'assets/images/ic_heart.svg',
                              ),
                            ),
                            Positioned(
                              top: 140,
                              right: 110,
                              child: SvgPicture.asset(
                                'assets/images/ic_stethoscope.svg',
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 120),
                                  child: Text(
                                    'Sign In',
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600,
                                      color: kColorPrimary,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(bottom: 32),
                                  child: Text(
                                    'Welcome Back!',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 8.0),
                          child: TextFormField(
                            controller: _emailIdController,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(
                                  color: kColorBorder,
                                  width: 1.5,
                                ),
                              ),
                              contentPadding: const EdgeInsets.all(18),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(18),
                                borderSide: BorderSide(color: kColorBorder),
                              ),
                              prefixIcon: SvgPicture.asset(
                                'assets/images/ic_prefix_email.svg',
                                width: 15,
                                height: 12,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                            validator: (value) {
                              if (!FormUtils.isEmailValid(value!)) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      TextFormField(
                          controller: _passwordController,
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(18),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: kColorBorder,
                                width: 1.5,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(color: kColorBorder),
                            ),
                            prefixIcon: SvgPicture.asset(
                              'assets/images/ic_prefix_lock.svg',
                              width: 15,
                              height: 12,
                              fit: BoxFit.scaleDown,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              child: _passwordVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Password cannot be empty';
                            }
                            return null;
                          }),
                      Container(
                        margin: const EdgeInsets.only(bottom: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(color: kColorBlack),
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 32),
                        child: userStore.obx(
                          (User? user) => SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: kStyleButtonPrimary,
                              onPressed: _login,
                              child: Text(
                                'Sign In',
                                style: kStyleTextButton,
                              ),
                            ),
                          ),
                          onError: (String? message) => SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: kStyleButtonPrimary,
                              onPressed: _login,
                              child: Text(
                                'Sign In',
                                style: kStyleTextButton,
                              ),
                            ),
                          ),
                          onEmpty: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: kStyleButtonPrimary,
                              onPressed: _login,
                              child: Text(
                                'Sign In',
                                style: kStyleTextButton,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 26.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Divider(
                                thickness: 1.25,
                                color: kColorBorder,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'or sign in with',
                                style: TextStyle(color: kColorTextGray),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Divider(
                                thickness: 1.25,
                                color: kColorBorder,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Container(
                              height: 45,
                              width: 50,
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(right: 14),
                              decoration: BoxDecoration(
                                border: Border.all(color: kColorBorder),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                  'assets/images/ic_facebook.svg'),
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: Container(
                              height: 45,
                              width: 50,
                              padding: const EdgeInsets.all(12),
                              margin: const EdgeInsets.only(right: 14),
                              decoration: BoxDecoration(
                                border: Border.all(color: kColorBorder),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                  'assets/images/ic_google.svg'),
                            ),
                            onTap: () {},
                          ),
                          InkWell(
                            child: Container(
                              height: 45,
                              width: 50,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(color: kColorBorder),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: SvgPicture.asset(
                                  'assets/images/ic_twitter.svg'),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Dont't have an account?",
                      style: TextStyle(color: kColorTextGray),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: kColorPrimary),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
