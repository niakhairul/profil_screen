import 'package:flutter/material.dart';
import 'package:profil_screen/profil_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  hintText: "Masukkan Username",
                ),
              ),
              SizedBox(height: 20),

              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Masukkan Password",
                ),
                obscureText: true,
              ),
              ElevatedButton(onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => ProfilScreen(username: usernameController.text,)),
                  );
                },
                child: const Text("Login"),),
            ],
          ),
        ),
      ),
    );
  }
}