// import 'dart:convert';

import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final tabTextStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );
  static const int loginTab = 0;
  static const int signUptab = 1;
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 32),
              child: Image.asset(
                'assets/img/icons/LOGO_SMALL.png',
                width: 120,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = loginTab;
                              });
                            },
                            child: Text(
                              'login'.toUpperCase(),
                              style: tabTextStyle.apply(color: selectedTabIndex==loginTab?Colors.white:Colors.white54),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = signUptab;
                              });
                            },
                            child: Text(
                              'sign up'.toUpperCase(),
                              style: tabTextStyle.apply(color: selectedTabIndex==signUptab?Colors.white:Colors.white54),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                          ),
                        ),
                        child:  SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child:selectedTabIndex==loginTab? const _Login():const _SignUp(),
                          ),
                        ),
                      ),
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
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome back',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Sign in with your account',
          style: TextStyle(
            color: Color(0xff2D4379),
            fontSize: 14,
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(
                MediaQuery.of(context).size.width,
                60,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: () {},
          child: const Text('LOGIN'),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Forgot your password?',
              style: TextStyle(
                color: Color(0xff2D4379),
                fontSize: 14,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Reset here',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Text(
            'Or sign in with'.toUpperCase(),
            style: const TextStyle(
              letterSpacing: 2,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/Google.png'),
            const SizedBox(
              width: 8,
            ),
            Image.asset('assets/img/icons/Vector.png'),
            const SizedBox(
              width: 8,
            ),
            Image.asset('assets/img/icons/Twitter.png')
          ],
        ),
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Welcome to blog club',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        const Text(
          'Please Enter Your Information',
          style: TextStyle(
            color: Color(0xff2D4379),
            fontSize: 14,
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('FullName'),
          ),
        ),
        const TextField(
          decoration: InputDecoration(
            label: Text('Username'),
          ),
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 24,
        ),
        ElevatedButton(
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(
                MediaQuery.of(context).size.width,
                60,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          onPressed: () {},
          child: const Text('SignUp'),
        ),
        const SizedBox(
          height: 32,
        ),
        Center(
          child: Text(
            'or sign up'.toUpperCase(),
            style: const TextStyle(
              letterSpacing: 2,
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/img/icons/Google.png'),
            const SizedBox(
              width: 8,
            ),
            Image.asset('assets/img/icons/Vector.png'),
            const SizedBox(
              width: 8,
            ),
            Image.asset('assets/img/icons/Twitter.png')
          ],
        ),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        suffixIcon: TextButton(
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(obscureText ? 'Show' : 'Hide'),
        ),
        label: const Text('Password'),
      ),
    );
  }
}
