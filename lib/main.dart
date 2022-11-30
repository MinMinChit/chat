import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:just_chat_beta/service/bloc/profile/profile_cubit.dart';
import 'package:just_chat_beta/service/provider/chat_lists.dart';
import 'package:just_chat_beta/ui/chat/chat_screen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:just_chat_beta/service/bloc/auth/create_user_cubit.dart';
import 'package:just_chat_beta/service/bloc/auth/sign_in_cubit.dart';
import 'package:just_chat_beta/service/bloc/bottom_nav/bottom_nav_bloc.dart';
import 'package:just_chat_beta/service/locator.dart';
import 'package:just_chat_beta/ui/auth/get_started.dart';
import 'package:just_chat_beta/ui/auth/landing.dart';
import 'package:just_chat_beta/ui/auth/login.dart';
import 'package:just_chat_beta/ui/auth/register.dart';
import 'package:just_chat_beta/ui/auth/setup_account.dart';
import 'package:just_chat_beta/ui/main_screen.dart';
import 'package:just_chat_beta/ui/search_screen.dart';
import 'package:just_chat_beta/widget/loading.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'model/user/user_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const JustChatBeta());
  locator();
}

class JustChatBeta extends StatefulWidget {
  const JustChatBeta({Key? key}) : super(key: key);

  @override
  State<JustChatBeta> createState() => _JustChatBetaState();
}

class _JustChatBetaState extends State<JustChatBeta> {
  @override
  void initState() {
    super.initState();
    _hiveInit();
  }

  void _hiveInit() async {
    Directory dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider<ChatListsProvider>(
          create: (BuildContext context) => ChatListsProvider.create(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavBloc>(
            create: (_) => getIt.call(),
          ),
          BlocProvider<CreateUserCubit>(
            create: (_) => getIt.call(),
          ),
          BlocProvider<SignInCubit>(
            create: (_) => getIt.call(),
          ),
          BlocProvider<ProfileCubit>(
            create: (_) => getIt.call(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LandingScreen.routeName,
          routes: {
            GetStatedScreen.routeName: (context) => const GetStatedScreen(),
            LandingScreen.routeName: (context) => const LandingScreen(),
            MainScreen.routeName: (context) => const MainScreen(),
            SearchScreen.routeName: (context) => const SearchScreen(),
            LoginScreen.routeName: (context) => const LoginScreen(),
            RegisterScreen.routeName: (context) => const RegisterScreen(),
            Loading.routeName: (context) => const Loading(),
            SetupScreen.routeName: (context) => const SetupScreen(),
            ChatScreen.routeName: (context) => ChatScreen(
                ModalRoute.of(context)?.settings.arguments as UserModel),
          },
        ),
      ),
    );
  }
}
