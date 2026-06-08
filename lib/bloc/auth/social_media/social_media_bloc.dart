import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:santvani_app/utils/app_enums.dart';

class SocialMediaState {
  const SocialMediaState({
    required this.status,
    required this.socialMediaStatus,
  });

  factory SocialMediaState.initial() {
    return const SocialMediaState(
      status: CommonScreenState.initial,
      socialMediaStatus: SocialMediaLoginState.initial,
    );
  }

  final CommonScreenState status;
  final SocialMediaLoginState socialMediaStatus;

  SocialMediaState copyWith({
    CommonScreenState? status,
    SocialMediaLoginState? socialMediaStatus,
  }) {
    return SocialMediaState(
      status: status ?? this.status,
      socialMediaStatus: socialMediaStatus ?? this.socialMediaStatus,
    );
  }
}

abstract class SocialMediaEvent {
  const SocialMediaEvent();
}

class SignUpWithGoogleEvent extends SocialMediaEvent {
  const SignUpWithGoogleEvent({required this.context});

  final BuildContext context;
}

class SignUpWithAppleEvent extends SocialMediaEvent {
  const SignUpWithAppleEvent({required this.context});

  final BuildContext context;
}

class SocialMediaBloc extends Bloc<SocialMediaEvent, SocialMediaState> {
  SocialMediaBloc() : super(SocialMediaState.initial()) {
    on<SignUpWithGoogleEvent>(
      (final SignUpWithGoogleEvent event, final Emitter<SocialMediaState> emit) {
        emit(state.copyWith(socialMediaStatus: SocialMediaLoginState.google));
        emit(state.copyWith(socialMediaStatus: SocialMediaLoginState.initial));
      },
    );
    on<SignUpWithAppleEvent>(
      (final SignUpWithAppleEvent event, final Emitter<SocialMediaState> emit) {
        emit(state.copyWith(socialMediaStatus: SocialMediaLoginState.apple));
        emit(state.copyWith(socialMediaStatus: SocialMediaLoginState.initial));
      },
    );
  }
}
