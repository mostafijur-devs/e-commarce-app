import 'package:e_commarce_app/main.dart';
import 'package:e_commarce_app/pages/dashboard_page.dart';
import 'package:e_commarce_app/providers/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/login';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  final _emailContolar = TextEditingController();
  final _passwordContolar = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String _errorMsg = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Text('Welcome to Admin', style:GoogleFonts.roboto(fontSize: 40),),
              const SizedBox(
                height: 100,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _emailContolar,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            hintText: 'Email Address',
                            prefixIcon: Icon(Icons.email),
                            border: OutlineInputBorder(
                                borderRadius:BorderRadius.all(Radius.circular(20)) )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'email is empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordContolar,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: 'Input password',
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                                borderRadius:BorderRadius.all(Radius.circular(20))
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password  is empty';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
          
                      ElevatedButton(
                        onPressed: _loginAdmin,
                        child: const Text('LogIn As Admin'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(_errorMsg,style: const TextStyle(fontSize: 20),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _loginAdmin() async {
    if(_formKey.currentState!.validate()){
      final email = _emailContolar.text;
      final password = _passwordContolar.text;
      EasyLoading.show(status: 'Please wait.... ');
      try{
        await context.read<FirebaseAuthProvider>().logInAdmin(email, password);
        Navigator.pushReplacementNamed(context, DashboardPage.routeName);

      } on FirebaseAuthException  catch(error){ //FirebaseAuthException error pick in firebase
          setState(() {
            _errorMsg= 'Login failed ${error.message!}';
          });
      }finally{
        EasyLoading.dismiss();
      }
    }

  }
}
