import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopfy/Provider/AppAuthProvider.dart';
import 'package:shopfy/views/Auth/Login.dart';
import 'package:shopfy/views/Auth/paswordforgot.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  void initState() {
    Provider.of<AppAuthProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<AppAuthProvider>(
            builder: (ctx, appAuthProvider, _) {
              return Form(
                key: appAuthProvider.formKey,
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                            Text(
                              ' | ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.blue,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AuthPage(),
                                  ),
                                );
                              },
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF515C6F),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'User',
                            suffixIcon: const Icon(
                              Icons.person_off_outlined,
                              color: Color(0xFF727C8E),
                            ),
                            labelStyle: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF515C6F),
                            ),
                            isDense: true,
                            filled: true,
                            fillColor: Color.fromARGB(255, 230, 233, 240),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: appAuthProvider.emailController,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'email is required';
                            }
                            if (!EmailValidator.validate(value)) {
                              return 'Enter Valid Email';
                            } else {
                              if (!value.split('@').last.contains('gmail')) {
                                return 'Enter Valid Gmail';
                              }
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text('Email'),
                            suffixIcon: const Icon(Icons.mail),
                            // fillColor: Colors.red,
                            isDense: true,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: appAuthProvider.obscureText,
                          controller: appAuthProvider.passwordController,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'password is required';
                            }
                            if (value.length < 8) {
                              return 'Password length must be 8';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            suffixIcon: InkWell(
                              onTap: () {
                                appAuthProvider.toggleObscure();
                              },
                              child: appAuthProvider.obscureText
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                            ),
                            isDense: true,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            await appAuthProvider.signUp(context);
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 60),
                          ),
                          child: const Text('Signup'),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
