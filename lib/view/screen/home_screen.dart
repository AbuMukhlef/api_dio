import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/cubit/activity_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ActivityCubit()..getActivity(),
      child: BlocConsumer<ActivityCubit, ActivityState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Text(
                  ActivityCubit.get(context).rickMorty?.info.count.toString() ??
                      ''),
            ),
          );
        },
      ),
    );
  }
}
