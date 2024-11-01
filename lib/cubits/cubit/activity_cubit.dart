import 'package:api_dio/core/const/api_const.dart';
import 'package:api_dio/data/model/rick_and%20_morty/rick_morty.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helper/dio_helpers.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(ActivityInitial());
  static ActivityCubit get(context) => BlocProvider.of(context);

  RickMorty? rickMorty;

  Future<void> getActivity() async {
    emit(ActivityLoadingState());
    await DioHelper.getData(endPoints: ApiConst.endpointCharacter)
        .then((value) {
      rickMorty = RickMorty.fromJson(value.data['results'][0]);
      print(rickMorty);
      emit(ActivityUpdateState());
    }).catchError((error) {
      if (error is DioException) {
        emit(ActivityErrorState(error.response!.data['error'], error: 'error'));
      } else {
        emit(ActivityErrorState(error.toString(), error: 'error'));
      }
    });
  }
}
