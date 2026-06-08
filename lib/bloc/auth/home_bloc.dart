import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:santvani_app/components/common_snack_bar.dart';

import 'package:santvani_app/data/models/response_model/app_setting_model.dart';

import 'package:santvani_app/helper/pref_helper/pref_keys.dart';

import 'package:santvani_app/utils/connection.dart';

import 'package:santvani_app/utils/constants.dart';
import 'package:santvani_app/utils/app_enums.dart';

part 'home_bloc.freezed.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc
    extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(HomeState.initial()) {
    on<OnShowAppUpdateDialog>(
          (
          final HomeEvent event,
          final Emitter<HomeState>
          emit,
          ) async {
        if (!await ConnectionUtils
            .isNetworkConnected()) {
          showErrorSnackBar(
            AppMessages
                .networkError
                .message,
          );

          return;
        }

        final int? lastTimestamp =
        await sharedPreferenceHelper
            .getInt(
          PrefKeys
              .lastAppUpdatePopupTimestampKey,
        );

        final DateTime now =
        DateTime.now();

        if (lastTimestamp !=
            null &&
            now
                .difference(
              DateTime.fromMillisecondsSinceEpoch(
                lastTimestamp,
              ),
            )
                .inHours <
                24) {
          return;
        }

        try {
          final QuerySnapshot<Map<String, dynamic>> response =
              await FirebaseFirestore.instance
                  .collection('mobile_app_settings')
                  .limit(1)
                  .get();

          if (response.docs.isEmpty) {
            return;
          }

          final Map<String, dynamic>? popupData =
              response.docs.first.data()['app_update_popup_data']
                  as Map<String, dynamic>?;

          if (popupData == null) {
            return;
          }

          emit(
            state.copyWith(
              appSettingsData: AppSettingModel.fromJson(popupData),
            ),
          );

          await sharedPreferenceHelper.setInt(
            PrefKeys.lastAppUpdatePopupTimestampKey,
            now.millisecondsSinceEpoch,
          );
        } catch (e) {
          debugPrint('Error checking update settings: $e');
        }
      },
    );
  }
}
