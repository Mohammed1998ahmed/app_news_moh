 
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/States.dart';
import '../Cubit/cubit.dart';
import '../componet/static.dart';
import 'Searsh/Searsh.dart';

class Home_Pages extends StatelessWidget {
  const Home_Pages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, states) {
        var c = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBarStatic(
            title: Text("News App"),
            actionslist: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => SearshPage(),
                      ),
                    );
                    // print(NewsCubit().Businnes.length.toString());
                  },
                  icon: Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    c.ChangedMode();
                    print(c.ismode.toString());
                  },
                  icon: Icon(Icons.brightness_6_outlined))
            ],
          ),
          body: NewsCubit.get(context)
              .Pages[NewsCubit.get(context).curennentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            // items: c.bottonNev,
            items: c.bottonNavation,
            // fixedColor: Colors.green,
            backgroundColor: c.ismode
                ? Colors.transparent.withOpacity(0.1)
                : Colors.white.withOpacity(0.1),
            index: c.curennentIndex,
            buttonBackgroundColor: c.ismode ? Colors.green : Colors.green,
            color: c.ismode ? Colors.white38 : Colors.green.withOpacity(0.8),
            height: 60,
            // unselectedItemColor: Colors.black,
            // currentIndex: c.curennentIndex,
            onTap: (index) {
              print(index);
              c.changedStatesBottonNav(index);
            },
          ),
        );
      },
    );
  }
}
