import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Cubit/States.dart';
import '../../Cubit/cubit.dart';
import '../../componet/static.dart';
import '../models/medules/wabview/wabview.dart';

class SearshPage extends StatelessWidget {
  SearshPage({Key? key}) : super(key: key);
  TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, states) {
        var c = NewsCubit.get(context).Searsh;
        print(c.length.toString());
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    style: NewsCubit.get(context).ismode
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: Colors.black),
                    enableInteractiveSelection: false,
                    controller: controller,
                    onChanged: (value) {
                      NewsCubit.get(context).getSearsh(value);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: "Searsh ...",
                      hintStyle: TextStyle(
                          color: Colors.green,
                          backgroundColor: Colors.white12,
                          fontSize: 23),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              Expanded(
                child: states is LoedingSearshStates
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.green,
                      ))
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          print(
                              "objectobjectobjectobjectobjectobjectobjectobject");
                          return InkWell(   onTap: () {
                          Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) =>
                              WabViewPage(Uri: c[index]['url']),
                        ),
                      );
                    },
                                                      child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: buildContaine1r(
                                height: 150,
                                width: double.infinity,
                                colordecoration: Colors.white.withOpacity(0.2),
                                child: Row(
                                  children: [
                                    buildContaine1r(
                                        height: 200,
                                        colordecoration: Colors.black,
                                        radius: 20,
                                        url: c[index]['urlToImage'].toString()),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                child: buildText(
                                                    data: c[index]['title'],
                                                    maxLines: 4,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText1)),
                                            buildText(
                                              data: c[index]['publishedAt'],
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider();
                        },
                        itemCount: c.length),
              ),
            ],
          ),
        );
      },
    );
  }
}
