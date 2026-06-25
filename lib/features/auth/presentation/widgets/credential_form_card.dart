import 'package:flutter/material.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'labeled_text_field.dart';
import 'social_auth_buttons.dart';

class CredentialFormCard extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController nameController;
  final bool isSignUpMode;
  final bool isLoading;
  final VoidCallback onSubmit;

  const CredentialFormCard({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.nameController,
    required this.isSignUpMode,
    required this.isLoading,
    required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color(0xff111614),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white10, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSignUpMode) ...[
            LabeledTextField(
              label: "FULL NAME",
              hintText: "Enter your name",
              controller: nameController,
              icon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
          ],

          LabeledTextField(
            label: "EMAIL ADDRESS",
            hintText: "name@company.com",
            controller: emailController,
            icon: Icons.mail_outline,
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 16),

          LabeledTextField(
            label: "PASSWORD",
            hintText: "••••••••",
            controller: passwordController,
            icon: Icons.lock_outline,
            obscure: true,
            trailing: !isSignUpMode
                ? GestureDetector(
                    onTap: () {}, // Handle Forgot Password action
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(height: 24),

          // Core Sign In Button implementation
          SizedBox(
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff00e676),
                disabledBackgroundColor: const Color(
                  0xff00e676,
                ).withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              onPressed: isLoading ? null : onSubmit,
              child: isLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.black,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      isSignUpMode ? "SIGN UP" : "SIGN IN",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 24),

          // Divider Section Layout
           Row(
            children: [
              Expanded(child: Divider(color: Colors.white12, thickness: 1)),
              Text(
                "OR CONTINUE WITH",
                style: TextStyle(
                  color: Colors.white38,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ).px(defaultHorizontal: 8),
              Expanded(child: Divider(color: Colors.white12, thickness: 1)),
            ],
          ),
          const SizedBox(height: 20),

          // Native Identity Providers Options
          // const SocialAuthButtons(),
        ],
      ),
    );
  }
}