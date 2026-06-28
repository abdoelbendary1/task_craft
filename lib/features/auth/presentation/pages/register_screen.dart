// lib/features/auth/presentation/pages/register_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/helpers/validators.dart';
import 'package:task_craft/core/routing/app_router.dart';
import 'package:task_craft/core/services/notification/notification_service.dart';
import 'package:task_craft/core/services/notification/notification_state.dart';
import 'package:task_craft/core/theme/app_colors.dart';
import 'package:task_craft/features/home/presentation/add_project/widgets/login_header_section.dart';
import 'package:task_craft/features/auth/presentation/widgets/credential_form_card.dart';
import 'package:task_craft/features/auth/presentation/widgets/login_footer.dart';
import 'package:task_craft/features/auth/presentation/bloc/user_bloc/user_bloc.dart';
import '../bloc/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "kahled@gmail.com");
    _passwordController = TextEditingController(text: "123456");
    _nameController = TextEditingController(text: "khaled");
    
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _handleAuthListener(BuildContext context, AuthState state) {
    state.when(
      initial: () {},
      loading: () {},
      authenticated: (userEntity) {
        context.read<UserBloc>().add(UserEvent.profileSaved(userEntity));
        const HomeRoute().go(context);
      },
      unauthenticated: (err) {
        context.read<UserBloc>().add(const UserEvent.logOut());
        if (err != null) {
          NotificationService.show(message: err, type: NotificationType.error);
        }
      },
    );
  }

  void _submitRegistration() {
    final nameError = AuthValidators.validateName(_nameController.text);
    final emailError = AuthValidators.validateEmail(_emailController.text);
    final passwordError = AuthValidators.validatePassword(_passwordController.text);

    if (nameError != null) {
      NotificationService.show(message: nameError, type: NotificationType.error);
      return;
    }
    if (emailError != null) {
      NotificationService.show(message: emailError, type: NotificationType.error);
      return;
    }
    if (passwordError != null) {
      NotificationService.show(message: passwordError, type: NotificationType.error);
      return;
    }

    context.read<AuthBloc>().add(
          AuthEvent.signUpSubmitted(
            name: _nameController.text.trim(),
            email: _emailController.text.trim(),
            password: _passwordController.text.trim(),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.brightness == Brightness.dark
          ? theme.scaffoldBackgroundColor
          : AppColors.activeBlueBg,
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: _handleAuthListener,
          builder: (context, state) {
            final isLoading = state.maybeWhen(
              loading: () => true,
              orElse: () => false,
            );

            return Center(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    20.vSpace,
                    const LoginHeaderSection(isSignUpMode: true),
                    40.vSpace,
                    CredentialFormCard(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      nameController: _nameController,
                      isSignUpMode: true,
                      isLoading: isLoading,
                      onSubmit: _submitRegistration,
                    ),
                    32.vSpace,
                    LoginFooterToggle(
                      isSignUpMode: true,
                      onToggle: () => const LoginRoute().go(context),
                    ),
                    20.vSpace,
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}