// import 'package:appnew/appNews/Cubit/States.dart';
// import 'package:appnew/appNews/Cubit/cubit.dart';
// import 'package:appnew/appNews/NetWork/netWork.dart';
// import 'package:appnew/pagemesseges/Message.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'Bmi/BMI.dart';
// import 'SettingBloc/SettingBloc.dart';
// import 'appNews/layut/Home_Page.dart';
// import 'appNews/layut/Searsh/Searsh.dart';
// import 'pagebloc/pageSecrren.dart';

// void main() {
//   NetWorkNewsApp.InitialState();
//   Bloc.observer = MyBlocObserver();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => NewsCubit()
//         ..getBusinness()
//         ..getHealth()
//         ..getScinecs()
//         ..getSports(),
//       child: BlocConsumer<NewsCubit, NewsStates>(
//         builder: (context, state) {
//           return MaterialApp(
//             debugShowCheckedModeBanner: false,
//             title: 'Flutter Demo',
//             theme: ThemeData(
//                 bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                     backgroundColor: Colors.greenAccent,
//                     elevation: 20.0,
//                     selectedItemColor: Colors.black,
//                     unselectedItemColor: Colors.white),
//                 appBarTheme: AppBarTheme(color: Colors.green)),
//             darkTheme: ThemeData(
//                 textSelectionTheme: TextSelectionThemeData(
//                     cursorColor: Colors.white,
//                     selectionColor: Colors.white,
//                     selectionHandleColor: Colors.white),
//                 scaffoldBackgroundColor: Colors.black,
//                 textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
//                 bottomNavigationBarTheme: BottomNavigationBarThemeData(
//                     backgroundColor: Colors.grey,
//                     elevation: 20.0,
//                     selectedItemColor: Colors.black,
//                     unselectedItemColor: Colors.white),
//                 appBarTheme: AppBarTheme(
//                   color: Colors.black12,
//                   elevation: 50,
//                 )),
//             themeMode: NewsCubit.get(context).ismode
//                 ? ThemeMode.dark
//                 : ThemeMode.light,
//             home: Home_Pages(),
//           );
//         },
//         listener: (context, states) {},
//       ),
//     );
//   }
// }
 

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'SettingBloc/SettingBloc.dart';
import 'appNews/Cubit/States.dart';
import 'appNews/Cubit/cubit.dart';
import 'appNews/NetWork/netWork.dart';
import 'appNews/layut/Home_Page.dart';

void main() {
  NetWorkNewsApp.InitialState();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..getBusinness()
        ..getHealth()
        ..getScinecs()
        ..getSports(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.greenAccent,
                    elevation: 20.0,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.white),
                appBarTheme: AppBarTheme(color: Colors.green)),
            darkTheme: ThemeData(
                textSelectionTheme: TextSelectionThemeData(
                    cursorColor: Colors.white,
                    selectionColor: Colors.white,
                    selectionHandleColor: Colors.white),
                scaffoldBackgroundColor: Colors.black,
                textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    backgroundColor: Colors.grey,
                    elevation: 20.0,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.white),
                appBarTheme: AppBarTheme(
                  color: Colors.black12,
                  elevation: 50,
                )),
            themeMode: NewsCubit.get(context).ismode
                ? ThemeMode.dark
                : ThemeMode.light,
            home: Home_Pages(),
          );
        },
        listener: (context, states) {},
      ),
    );
  }
}
