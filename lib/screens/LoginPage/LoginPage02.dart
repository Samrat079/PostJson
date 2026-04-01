import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:untitled/UnStructured/Theme/GradientContainer01.dart';

import '../../Services/AuthServices/AuthServices.dart';
import '../../Services/UserServices/UserServices.dart';

class LoginPage02 extends StatefulWidget {
  const LoginPage02({super.key});

  @override
  State<LoginPage02> createState() => _LoginPage02State();
}

class _LoginPage02State extends State<LoginPage02> {
  final _login_page_02 = GlobalKey<FormBuilderState>();

  String? _errorMessage;
  bool _isLoading = false;

  void submitHandler() {
    final formState = _login_page_02.currentState!;
    if (!formState.validate()) return;

    final String username = formState.fields["username"]?.value;
    final String password = formState.fields['password']?.value;

    _login(username, password);
  }

  void _login(String username, String password) async {
    setState(() {
      _errorMessage = null;
      _isLoading = true;
    });

    try {
      await AuthServices().login(username, password);
      await UserServices().currUser();

      Navigator.pushReplacementNamed(
        context,
        '/Profile',
        arguments: UserServices().user.id,
      );
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceFirst("Exception: ", "");
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer01(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 28,
                children: [
                  //////////        Lock Icon        ///////////////
                  Icon(Icons.lock_outline, size: 120),

                  //////////////         Login Form card         //////////
                  Card(
                    child: FormBuilder(
                      key: _login_page_02,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 26,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //////////////////////      Welcome         /////////////////////
                            const Text(
                              "Welcome Back",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 26),
                            ),
                            SizedBox(height: 24),

                            /////////////////////              username          ////////////////////
                            FormBuilderTextField(
                              name: "username",
                              validator: FormBuilderValidators.username(),
                              decoration: InputDecoration(
                                labelText: "username",
                                filled: true,
                                fillColor: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                prefixIcon: const Icon(Icons.person_outline),
                              ),
                            ),
                            SizedBox(height: 12),

                            ///////////////            password           ///////////////////
                            FormBuilderTextField(
                              name: "password",
                              obscureText: true,
                              validator: FormBuilderValidators.password(
                                minLength: 4,
                                minLowercaseCount: 0,
                                minNumberCount: 0,
                                minSpecialCharCount: 0,
                                minUppercaseCount: 0,
                              ),
                              decoration: InputDecoration(
                                labelText: "password",
                                filled: true,
                                fillColor: Theme.of(
                                  context,
                                ).colorScheme.surfaceContainerHighest,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                prefixIcon: const Icon(Icons.lock_outline),
                              ),
                            ),

                            ////////////               error msg              ////////////////////
                            if (_errorMessage != null) ...[
                              SizedBox(height: 12),
                              Text(
                                _errorMessage!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],

                            //////////////////          Buttons        /////////////
                            SizedBox(height: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.redAccent,
                                foregroundColor: Theme.of(
                                  context,
                                ).colorScheme.surface,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: _isLoading ? null : submitHandler,
                              child: _isLoading
                                  ? const SizedBox(
                                      height: 16,
                                      width: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text("Login"),
                            ),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(
                                  context,
                                ).colorScheme.secondaryContainer,
                                foregroundColor: Theme.of(
                                  context,
                                ).colorScheme.secondary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              onPressed: _isLoading
                                  ? null
                                  : () => _login_page_02.currentState!.reset(),
                              child: const Text("Clear"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Divider(),

                  //////////////////        test Credentials       /////////////////////
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "This is a demo app using dummyjson, this does not have a signup. if you wish to login follow the links to some ",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                        TextSpan(
                          text: "Test Credentials",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.blue[800],
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Navigator.pushNamed(context, '/test_cred'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
