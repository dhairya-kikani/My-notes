import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/utilities/show_error_dialoge.dart';

class LoginView extends StatefulWidget {
  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  


  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('login')),
      body: Column(
        children: [
          TextField(
              controller: _email,
              decoration: const InputDecoration(
                hintText: 'Enter your Email here',
              )),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Enter your Password here',
            ),
          ),
          TextButton(
            onPressed: () async {
              final email = _email.text;
              final password = _password.text;
              try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                  email: email,
                  password: password,
                );  
                final user = FirebaseAuth.instance.currentUser;
                if(user?.emailVerified ?? false) {
                  // user's email is verified
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamedAndRemoveUntil( 
                  notesRoute,
                   (route) => false,
                );
                } else {
                  // user's email is NOT verified
                  // ignore: use_build_context_synchronously
                  Navigator.of(context).pushNamedAndRemoveUntil( 
                  verifyEmailRoute,
                   (route) => false,
                  );
                }
                
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  await showErrorDialoge(
                    context,
                  'User not found'
                  );
                } else if (e.code == 'wrong-password') {
                  await showErrorDialoge(
                    context,
                  'Wrong credentials'
                  );
                } else {
                  await showErrorDialoge(
                    context,
                  'Error: ${e.code}',
                  );
                } 
              } catch (e) {
                await showErrorDialoge(
                    context,
                  e.toString(),
                  );
              }
            },
            child: const Text('Login'),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil(
                      registerRoute,
                       (route) => false);
              },
              child: const Text('Not Register yet? Register here!'))
        ],
      ),
    );
  }
}

