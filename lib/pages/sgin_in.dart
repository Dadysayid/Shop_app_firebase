import 'package:flutter/material.dart';
import 'package:shop_app/pages/sign_up.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(),
            _inputField(context),
            _forgetPassword(),
            _signUp(context)
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome Back",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text("Enter your credentials to login"),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              hintText: "Username",
              fillColor: const Color.fromRGBO(245, 247, 249, 1),
              filled: true,
              prefixIcon: const Icon(Icons.person, color: Colors.grey)),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none),
              hintText: "Password",
              fillColor: const Color.fromRGBO(245, 247, 249, 1),
              filled: true,
              prefixIcon: const Icon(Icons.lock, color: Colors.grey)),
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(254, 206, 1, 1),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: const StadiumBorder()),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ),
      ],
    );
  }

  Widget _forgetPassword() {
    return TextButton(
      onPressed: () => {},
      child: const Text(
        "Forget password",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _signUp(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text("Don't have an account? "),
      TextButton(
          onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignUp()))
              },
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.black),
          ))
    ]);
  }
}
