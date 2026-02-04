import 'package:flutter/material.dart';
import 'package:realtime_chat_app/widgets/my_button.dart';
import 'package:realtime_chat_app/widgets/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // email and password controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // tap to go to login
  final void Function()? onTap;

  void register() {}

  RegisterPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.message,
              size: 60,
              color: Theme.of(context).colorScheme.primary,
            ),

            const SizedBox(height: 50),

            //welcome back message
            Text(
              "Let's create an account for you",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            // email textfield
            MyTextField(hintText: "Email", controller: _emailController),

            const SizedBox(height: 10),

            // password textfield
            MyTextField(
              hintText: "Password",
              controller: _passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 10),

            // confirm password textfield
            MyTextField(
              hintText: "Confirm Password",
              controller: _confirmPasswordController,
            ),

            const SizedBox(height: 25),

            // login button
            MyButton(text: "Register", onTap: register),
            const SizedBox(height: 25),

            // register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account? ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                ),
              ],
            ),

            //
          ],
        ),
      ),
    );
  }
}
