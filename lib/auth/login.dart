import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');


  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  labelText: 'Email',
                  fillColor: Colors.grey,
                ),
                validator: (text) {
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(_emailController.text)
                      ? 'Invalid email'
                      : null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: _isHidden,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility),
                  ),
                  labelText: 'Password',
                  fillColor: Colors.grey,
                ),
                //validator: (text) {},
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                  ),
                  onPressed: () async {
                    try {
                      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text,
                      );
                      setState((){
                      });

                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context){
                          return const AlertDialog(
                            title: Text('Login error'),
                            content: Text('No user found for that email.'),
                          );
                        });

                        //print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context){
                              return const AlertDialog(
                                title: Text('Login error'),
                                content: Text('Wrong password provided for that user.'),
                              );
                            });
                        //print('Wrong password provided for that user.');
                      }
                    }

                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                      left: 60,
                      right: 60,
                    ),
                    child: Text('LOGIN'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}
