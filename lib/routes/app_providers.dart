import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:santvani_app/bloc/auth/forgot_password/forgot_password_bloc.dart';
import 'package:santvani_app/bloc/auth/login/login_bloc.dart';
import 'package:santvani_app/bloc/auth/signup/signup_bloc.dart';
import 'package:santvani_app/bloc/my_app/localisation_bloc.dart';
import 'package:santvani_app/bloc/tab_navigation_cubit.dart';
import 'package:santvani_app/bloc/user/profile_bloc.dart';

import 'package:santvani_app/data/repository/auth_repo.dart';
import 'package:santvani_app/data/repository/auth_repo_impl.dart';
import 'package:santvani_app/data/repository/user_repo.dart';
import 'package:santvani_app/data/repository/user_repo_impl.dart';
import 'package:santvani_app/data/repository/search_repo.dart';
import 'package:santvani_app/data/repository/search_repo_impl.dart';

import 'package:santvani_app/data/repository/post_repo.dart';
import 'package:santvani_app/data/repository/post_repo_impl.dart';
import 'package:santvani_app/data/repository/like_repo.dart';
import 'package:santvani_app/data/repository/like_repo_impl.dart';
import 'package:santvani_app/data/repository/comment_repo.dart';
import 'package:santvani_app/data/repository/comment_repo_impl.dart';
import 'package:santvani_app/data/repository/share_repo.dart';
import 'package:santvani_app/data/repository/share_repo_impl.dart';
import 'package:santvani_app/data/repository/save_repo.dart';
import 'package:santvani_app/data/repository/save_repo_impl.dart';
import 'package:santvani_app/data/repository/chat_repo.dart';
import 'package:santvani_app/data/repository/chat_repo_impl.dart';
import 'package:santvani_app/data/repository/category_repo.dart';
import 'package:santvani_app/data/repository/category_repo_impl.dart';
import 'package:santvani_app/bloc/chat/chat_bloc.dart';
import 'package:santvani_app/bloc/category/category_bloc.dart';

List<BlocProvider<StateStreamableSource<Object?>>> getAppProviders() {
  return <BlocProvider<StateStreamableSource<Object?>>>[
    // ------------------------------------------------------------------------
    // Localisation Bloc
    // ------------------------------------------------------------------------
    BlocProvider<LocalisationBloc>(
      create: (final BuildContext context) => LocalisationBloc(),
    ),

    // -------------------
    // Login Bloc
    // ------------------------------------------------------------
    BlocProvider<LoginBloc>(
      create: (final BuildContext context) =>
          LoginBloc(authRepo: context.read<AuthRepo>()),
    ),

    // ------------------------------------------------------------------------
    // Signup Bloc
    // ------------------------------------------------------------------------
    BlocProvider<SignUpBloc>(
      create: (final BuildContext context) =>
          SignUpBloc(authRepo: context.read<AuthRepo>()),
    ),

    // ------------------------------------------------------------------------
    // Forgot Password Bloc
    // ------------------------------------------------------------------------
    BlocProvider<ForgotPasswordBloc>(
      create: (final BuildContext context) =>
          ForgotPasswordBloc(authRepo: context.read<AuthRepo>()),
    ),

    BlocProvider<TabNavigationCubit>(
      create: (final BuildContext context) => TabNavigationCubit(),
    ),

    // ------------------------------------------------------------------------
    // Profile Bloc
    // ------------------------------------------------------------------------
    BlocProvider<ProfileBloc>(
      create: (final BuildContext context) => ProfileBloc(
        context.read<AuthRepo>(),
        userRepo: context.read<UserRepo>(),
      )..add(const OnGetUserProfile()),
    ),

    // ------------------------------------------------------------------------
    // Chat Bloc
    // ------------------------------------------------------------------------
    BlocProvider<ChatBloc>(
      create: (final BuildContext context) =>
          ChatBloc(chatRepo: context.read<ChatRepo>()),
    ),

    // ------------------------------------------------------------------------
    // Category Bloc
    // ------------------------------------------------------------------------
    BlocProvider<CategoryBloc>(
      create: (final BuildContext context) =>
          CategoryBloc(categoryRepo: context.read<CategoryRepo>())..add(const CategoryEvent.loadCategories()),
    ),
  ];
}

List<RepositoryProvider<dynamic>> getRepoProviders() {
  return <RepositoryProvider<dynamic>>[
    // ------------------------------------------------------------------------
    // Auth Repository
    // ------------------------------------------------------------------------
    RepositoryProvider<AuthRepo>(
      create: (final BuildContext context) => AuthRepoImp(),
    ),

    // ------------------------------------------------------------------------
    // User Repository
    // ------------------------------------------------------------------------
    RepositoryProvider<UserRepo>(
      create: (final BuildContext context) => UserRepoImpl(),
    ),

    // ------------------------------------------------------------------------
    // Search Repository
    // ------------------------------------------------------------------------
    RepositoryProvider<SearchRepo>(
      create: (final BuildContext context) => SearchRepoImpl(),
    ),

    // ------------------------------------------------------------------------
    // Post Repository
    // ------------------------------------------------------------------------
    RepositoryProvider<PostRepo>(
      create: (final BuildContext context) => PostRepoImpl(),
    ),

    // ------------------------------------------------------------------------
    // Like Repository
    // ------------------------------------------------------------------------
    RepositoryProvider<LikeRepo>(
      create: (final BuildContext context) => LikeRepoImpl(),
    ),

    // ------------------------------------------------------------------------
    // Comment Repository
    // ------------------------------------------------------------------------
    RepositoryProvider<CommentRepo>(
      create: (final BuildContext context) => CommentRepoImpl(),
    ),

    // ------------------------------------------------------------------------
    // Share Repository
    // ------------------------------------------------------------------------
    RepositoryProvider<ShareRepo>(
      create: (final BuildContext context) => ShareRepoImpl(),
    ),

    // ------------------------------------------------------------------------
    // Save Repository
    // ------------------------------------------------------------------------
    RepositoryProvider<SaveRepo>(
      create: (final BuildContext context) => SaveRepoImpl(),
    ),

    // ------------------------------------------------------------------------
    // Chat Repository
    // ------------------------------------------------------------------------
    RepositoryProvider<ChatRepo>(
      create: (final BuildContext context) => ChatRepoImpl(),
    ),

    // ------------------------------------------------------------------------
    // Category Repository
    // ------------------------------------------------------------------------
    RepositoryProvider<CategoryRepo>(
      create: (final BuildContext context) => CategoryRepoImpl(),
    ),
  ];
}
