import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase/firebase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  //CollectionReference users = FirebaseFirestore.instance.collection('users');

  bool _isHidden = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  String? inputData(){
    final User? user = auth.currentUser;
    final uid = user!.uid;
    return uid;
  }

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
                validator: (value){
                  if (RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(value!)) {
                      return null;
                    }else{
                    return 'Enter valid Email Address';
                  }
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _passwordController,
                keyboardType: TextInputType.text,
                obscureText: _isHidden,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                  labelText: 'Password',
                  fillColor: Colors.grey,
                  suffix: InkWell(
                    onTap: _togglePasswordView,
                      child: Icon(
                          _isHidden ?
                          Icons.visibility_off
                              : Icons.visibility),
                  ),
                ),
                validator: (value){
                  RegExp regex =
                  RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  } else {
                    if (!regex.hasMatch(value)) {
                      return 'Enter valid password';
                    } else {
                      return null;
                    }
                  }
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _confirmPasswordController,
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
                        _isHidden ?
                        Icons.visibility_off
                            : Icons.visibility),
                  ),
                  labelText: 'Confirm Password',
                  fillColor: Colors.grey,
                ),
                validator: (text){
                  if(text!.isEmpty || (_confirmPasswordController.text != _passwordController.text) ){
                    return 'Please enter matching password';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  ),
                  onPressed: () async{
                    if(_formKey.currentState!.validate()){
                      try {
                        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text
                        );

                        await FirebaseFirestore.instance.collection('fUsers').doc(inputData()).set({
                          'email': _emailController.text,
                          'password': _passwordController.text,
                          'role':'user'
                        });

                        setState(() {
                          _formKey.currentState!.reset();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Validated'),
                          ),
                        );

                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          print('The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          const AlertDialog(
                            title: Text('Sorry'),
                            content: Text('The account already exists for that email.'),
                          );
                        }
                      } catch (e) {
                        // ignore: avoid_print
                        print(e);
                      }
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15, left: 60, right: 60,),
                    child: Text('SIGNUP'),
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
    setState((){
      _isHidden = !_isHidden;
    });
  }

  // void userData() async{
  //   await databaseReference.collection('fUsers').document(inputData()).setData({
  //     'email':'',
  //     'password':'',
  //     'role':''
  //   });
  // }
}
