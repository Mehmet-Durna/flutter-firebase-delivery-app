import 'package:delivery/components/my_button.dart';
import 'package:delivery/components/my_textfield.dart';
import 'package:delivery/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap}) ;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>{
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

//sign up function
void register() async{
  // get auth service

  final authService = AuthService();

  // check if passwords match -> create account

  if(passwordController.text == confirmPasswordController.text){
    try{
      await authService.signUpWithEmailPassword(emailController.text, passwordController.text);
    }
    //catch any errors
catch(e){
  showDialog(
    context: context, 
    builder: (context)=> const AlertDialog(
      title: Text("Error on sign up"),
    ),
    );
  }
  }

  // if passwords do not match -> show error message
  else{
    showDialog(
      context: context,
      builder: (context)=> const AlertDialog(
        title: Text("Passwords do not match"),
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
            'Lets create an account',
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
               MyTextField(
            controller: confirmPasswordController,
             hintText: 'Confirm Password',
             obscureText: true, 
             ),

              const SizedBox(height: 25),

             MyButon(
              onTap: register,
               text: "Sign Up"),

              const SizedBox(height: 25),

             // already a member? sign in button

             Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Login now",
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