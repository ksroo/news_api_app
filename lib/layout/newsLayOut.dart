import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

class NewsLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit()
        ..getBusiness()
        ..isDark,
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "News App",
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    CounterCubit.get(context).changeAppMode();
                    
                  },
                  icon: Icon(
                    Icons.brightness_4_outlined,
                  ),
                ),
              ],
              elevation: 0,
            ),
            body: CounterCubit.get(context)
                .bottomScreens[CounterCubit.get(context).currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: CounterCubit.get(context).currentIndex,
              onTap: (index) {
                CounterCubit.get(context).changeIndex(index);
              },
              type: BottomNavigationBarType.fixed,
              items: CounterCubit.get(context).bottomItems,
            ),
          );
        },
      ),
    );
  }
}

// https://newsapi.org/v2/top-headlines
//  ?%20
// country=eg&category=business&apiKey=ffc8c0eefece41b28b04ab971aa79cc7
