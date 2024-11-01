import 'package:api_dio/core/const/api_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/helper/dio_helpers.dart';

part 'activity_state.dart';

class ActivityCubit extends Cubit<ActivityState> {
  ActivityCubit() : super(ActivityInitial());
  static ActivityCubit get(context) => BlocProvider.of(context);

  Future<void> getActivity() async {
    emit(ActivityLoadingState());
    await DioHelper.getData(endPoints: ApiConst.endpointCharacter)
        .then((value) {
      print(value.data);
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
