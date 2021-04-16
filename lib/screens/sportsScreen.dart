import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/widgets/buildArticalItems.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterCubit, CounterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = CounterCubit.get(context).sports;
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index) => BuildArticalItems(list[index]), 
            separatorBuilder: (context,index) => Divider(height: 2,), 
            itemCount: 10),
          fallback: (context)=> Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}
