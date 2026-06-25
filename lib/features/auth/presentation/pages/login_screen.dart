import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_craft/core/helpers/extentions.dart';
import 'package:task_craft/core/routing/app_router.dart';
import 'package:task_craft/core/services/notification/notification_service.dart';
import 'package:task_craft/core/services/notification/notification_state.dart';
import 'package:task_craft/core/theme/app_colors.dart';
import 'package:task_craft/features/add_project/widgets/login_header_section.dart';
import 'package:task_craft/features/auth/presentation/widgets/credential_form_card.dart';
import 'package:task_craft/features/auth/presentation/widgets/login_footer.dart';
import '../bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _nameController;
  bool _isSignUpMode = false;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController(
      text: "abdelrahman.elbendary0@gmail.com",
    );
    _passwordController = TextEditingController(text: "123456");
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  void _handleAuthListener(BuildContext context, AuthState state) {
    state.maybeWhen(
      unauthenticated: (err) {
        if (err != null) {
          NotificationService.show(message: err, type: NotificationType.error);
        }
      },
      orElse: () {
        HomeRoute().go(context);
      },
    );
  }

  void _submitForm() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final name = _nameController.text.trim();
    final authBloc = context.read<AuthBloc>();

    if (_isSignUpMode) {
      authBloc.add(
        AuthEvent.signUpSubmitted(name: name, email: email, password: password),
      );
    } else {
      authBloc.add(AuthEvent.loginSubmitted(email: email, password: password));
    }
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
                    LoginHeaderSection(isSignUpMode: _isSignUpMode),
                    40.vSpace,
                    CredentialFormCard(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      nameController: _nameController,
                      isSignUpMode: _isSignUpMode,
                      isLoading: isLoading,
                      onSubmit: _submitForm,
                    ),
                    32.vSpace,
                    LoginFooterToggle(
                      isSignUpMode: _isSignUpMode,
                      onToggle: () =>
                          setState(() => _isSignUpMode = !_isSignUpMode),
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
