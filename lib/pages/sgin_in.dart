import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/pages/home_page.dart';
import 'package:shop_app/pages/sign_up.dart';
import 'package:shop_app/providers/authviewmodel.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<Authviewmodel>(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(),
            _inputField(authViewModel, context),
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

  Widget _inputField(authViewModel, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _emailController,
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
          controller: _pwdController,
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
          onPressed: () async {
            final email = _emailController.text.trim();
            final pwd = _pwdController.text.trim();
            final success = await authViewModel.login(email, pwd, context);
            if (success) {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            }
          },
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
