import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/widgets/buildArticalItems.dart';
import 'package:conditional_builder/conditional_builder.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: state is! NewGetBusinessLoadigState,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index) => BuildArticalItems(CounterCubit.get(context).business[index]), 
            separatorBuilder: (context,index) => Divider(height: 2,), 
            itemCount: 10),
          fallback: (context)=> Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
