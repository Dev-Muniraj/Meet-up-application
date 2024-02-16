import 'package:custom_signin_buttons/button_data.dart';
import 'package:custom_signin_buttons/button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task_1/constants/colors.dart';
import 'package:flutter_task_1/constants/sizes.dart';
import 'package:flutter_task_1/constants/text_strings.dart';
import 'package:flutter_task_1/navigation_menu.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool passToggle = true;
  bool isButtonActive = true;
  bool validate = false;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailController.addListener(() {
      final isButtonActive = emailController.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
    passwordController.addListener(() {
      final isButtonActive = passwordController.text.isNotEmpty;
      setState(() {
        this.isButtonActive = isButtonActive;
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: kSizes.lg, vertical: kSizes.xl),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: kSizes.defaultSpace),
                Center(
                    child: Text(
                  kAppText,
                  style: Theme.of(context).textTheme.labelLarge,
                )),
                const SizedBox(height: kSizes.spaceBtwSections),
                Center(
                    child: Text(kWelcomeText,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: kLabelColor))),
                const SizedBox(height: kSizes.spaceBtwSections),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kSizes.md),
                    child: Text(
                      kSignInText,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: kTextColor),
                    )),
                const SizedBox(height: kSizes.sm),
                TextFormField(
                  controller: emailController,
                  validator: ( value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number or email address';
                    }
                    if (RegExp(
                            r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b')
                        .hasMatch(value)) {
                      return null; // Valid email
                    }
                    if (RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                      return null; // Valid mobile number
                    }
                    return 'Please enter a valid email address or 10 digit mobile number';
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(kSizes.cardRadiusMd),
                      hintText: "Enter Email or Mob No.",
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(kSizes.borderRadiusMd),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius:
                            BorderRadius.circular(kSizes.borderRadiusMd),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(kSizes.borderRadiusMd),
                        borderSide: const BorderSide(color: Colors.grey),
                      )),
                ),
                const SizedBox(height: kSizes.sm),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSizes.md),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(kSignInWithOTP,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: kTextButtonColor)),
                      )),
                ),
                const SizedBox(height: kSizes.defaultSpace),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: kSizes.md),
                    child: Text(
                      kPasswordText,
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .apply(color: kTextColor),
                    )),
                const SizedBox(height: kSizes.sm),
                TextFormField(
                  controller: passwordController,
                  obscureText: passToggle,
                  obscuringCharacter: "*",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter the passcode";
                    }
                    // Check for minimum length
                    else if (passwordController.text.length < 6) {
                      return "Enter minimum 6 values";
                    }

                    // Check for at least one uppercase letter
                    if (!passwordController.text.contains(RegExp(r'[A-Z]'))) {
                      return "Enter at least one uppercase letter";
                    }

                    // Check for at least one lowercase letter
                    if (!passwordController.text.contains(RegExp(r'[a-z]'))) {
                      return "Enter at least one lowercase letter";
                    }

                    // Check for at least one digit
                    if (!passwordController.text.contains(RegExp(r'[0-9]'))) {
                      return "Enter at least one digit";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(kSizes.cardRadiusMd),
                      hintText: "Enter Password",
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: Icon(passToggle
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(kSizes.borderRadiusMd),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius:
                            BorderRadius.circular(kSizes.borderRadiusMd),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(kSizes.borderRadiusMd),
                        borderSide: const BorderSide(color: Colors.grey),
                      )),
                ),
                const SizedBox(height: kSizes.sm),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                          hoverColor: Colors.grey,
                        ),
                        Text(kRememberMe,
                            style: Theme.of(context).textTheme.titleSmall),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kSizes.md),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(kForgetPassword,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: kTextButtonColor)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kSizes.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isButtonActive
                        ? () {
                            setState(() {
                              isButtonActive = false;
                            });
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NavigationMenu()));
                              emailController.clear();
                              passwordController.clear();
                            }
                          }
                        : null,
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(validate
                          ? kLabelColor
                          : kLabelColor.withOpacity(0.5)),
                    ),
                    child: const Text(kSubmit),
                  ),
                ),
                const SizedBox(height: kSizes.defaultSpace),
                Row(
                  children: [
                    const Expanded(child: Divider(thickness: 0.5)),
                    const SizedBox(width: kSizes.sm),
                    Text("Or", style: Theme.of(context).textTheme.bodyLarge),
                    const SizedBox(width: kSizes.sm),
                    const Expanded(child: Divider(thickness: 0.5)),
                  ],
                ),
                const SizedBox(height: kSizes.defaultSpace),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: kSizes.spaceBtwSections),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SignInButton(
                        button: Button.Google,
                        mini: true,
                      ),
                      SignInButton(
                        button: Button.LinkedIn,
                        mini: true,
                      ),
                      SignInButton(
                        button: Button.Facebook,
                        mini: true,
                      ),
                      SignInButton(
                        button: Button.InstagramGradient,
                        mini: true,
                      ),
                      SignInButton(
                        button: Button.GitHub,
                        mini: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: kSizes.defaultSpace),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Business User?",
                              style: Theme.of(context).textTheme.bodyLarge),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Login Here",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(color: kTextButtonColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: kSizes.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("Don't have an account?",
                              style: Theme.of(context).textTheme.bodyLarge),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .apply(color: kTextButtonColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kSizes.spaceBtwSections),
                Center(
                  child: Column(
                    children: [
                      Text(
                        kPrivacyText,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.grey),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Text(kTermsAndConditions,
                              style: Theme.of(context).textTheme.bodyMedium)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
