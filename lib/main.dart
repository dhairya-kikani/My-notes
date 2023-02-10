  
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/login_view.dart';
import 'package:mynotes/register_view.dart';
import 'package:mynotes/verify_email_view.dart';
import 'firebase_options.dart';
import 'dart:developer' as devtools show log;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const HomePage(),
    routes: {
      loginRoute: (context) => const LoginView(),
      registerRoute: (context) => const RegisterView(),
      notesRoute: (context) => const NotesView(),
    },
  ));
}

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Verify Email')),
      body: Column(
        children: [
          const Text('Please verify you email address'),
          TextButton(
              onPressed: () async {
                final user = FirebaseAuth.instance.currentUser;
                await user?.sendEmailVerification();
              },
              child: const Text('Send email verification'))
        ],
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            final user = FirebaseAuth.instance.currentUser;
            if (user != null) {
              if (user.emailVerified) {
                print('Hello World');
                return const NotesView();
              } else {
                return const VerifyEmailView();
              
              }
            } else {
              return const LoginView();
            }
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
enum MenuAction { logout }

class NotesView extends StatefulWidget {
  const NotesView({Key? key}) : super(key: key);

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main UI'),
        actions: [
PopupMenuButton<MenuAction>(
  onSelected: (value) async {
    switch (value){
       
      case MenuAction.logout:
        final shouldLogout = await showLogOutDialog(context);
       if (shouldLogout) {
       await FirebaseAuth.instance.signOut();
       Navigator.of(context).pushNamedAndRemoveUntil(
        loginRoute,
         (_) => false);
       }
    }
  },
  itemBuilder: (context) {
return const [
  PopupMenuItem<MenuAction>(
    value: MenuAction.logout,
    child: Text("Log Out"),
  )
];
  },
),
        ],
      ),
  
      body: const Text('Hello World'),
    );
  }
}

Future<bool> showLogOutDialog(BuildContext context) {
return showDialog<bool>(
 context: context,
 builder: (context) {
  return AlertDialog(
    title: const Text('Sign Out'),
    content: const Text('Are you sure you want to sign out?'),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop(false);
        },
        child: const Text('Cancel'),
        ),
        TextButton(onPressed: () {
        Navigator.of(context).pop(true);  
        }, child: const Text('Log Out'),
        ),
    ],
  );
},
).then((value) => value ??  false);
}