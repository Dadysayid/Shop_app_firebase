import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
                  ),
                  const Text("Create an account"),
                  const SizedBox(height: 60),
                  Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "User name",
                          fillColor: const Color.fromRGBO(245, 247, 249, 1),
                          filled: true,
                          prefixIcon: const Icon(Icons.person, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Email",
                          fillColor: const Color.fromRGBO(245, 247, 249, 1),
                          filled: true,
                          prefixIcon: const Icon(Icons.email, color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Password",
                          fillColor: const Color.fromRGBO(245, 247, 249, 1),
                          filled: true,
                          prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(254, 206, 1, 1),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  "Sign up",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const Center(child: Text("OR")),
              Container(
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromRGBO(254, 206, 1, 1)),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/d1.png"),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text(
                        "Sign in with Google",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
