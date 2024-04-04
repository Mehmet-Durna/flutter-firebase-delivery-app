import 'package:delivery/components/my_button.dart';
import 'package:delivery/components/my_textfield.dart';
import 'package:delivery/services/auth/auth_service.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

//login method
void login() async{
  // get instance of auth service
  final _authService = AuthService();

  //try sign in
  try{
    await _authService.signInWithEmailPassword(emailController.text, passwordController.text);
  }

  // catch any errors
  catch(e){
    showDialog(
      context: context,
      builder: (context)=> const AlertDialog(
        title: Text("Error on sign in"),
      ),
    );
}
}


   @override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Theme.of(context).colorScheme.background,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.lock_open_rounded,
            size: 100,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          
          const SizedBox(height: 25),

          //message, app slogan

          Text(
            'Welcome to Delivery',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 25),

          MyTextField(
            controller: emailController,
             hintText: 'Email',
             obscureText: false,
             ),

               const SizedBox(height: 10),

          MyTextField(
            controller: passwordController,
             hintText: 'Password',
             obscureText: true, 
             ),

              const SizedBox(height: 25),

             MyButon(
              onTap: login,
               text: "Sign In"),

              const SizedBox(height: 25),

             // not a member? sign up button

             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
             )
        ],
      ),
    ),
  );
}
}

