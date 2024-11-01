part of 'activity_cubit.dart';

@immutable
sealed class ActivityState {}

final class ActivityInitial extends ActivityState {}

final class ActivityLoadingState extends ActivityState {}

final class ActivityUpdateState extends ActivityState {}

final class ActivityErrorState extends ActivityState {
  final String error;
  ActivityErrorState(data, {required this.error});
}
