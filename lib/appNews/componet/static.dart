import 'package:flutter/material.dart';

import '../Cubit/cubit.dart';

PreferredSizeWidget? AppBarStatic({Widget? title, List<Widget>? actionslist}) {
  return AppBar(
    title: title,
    actions: actionslist,
  );
}

Widget buildContaine1r({
  double? width,
  double? height,
  Color? colordecoration,
  double? radius,
  String? url,
  Widget? child,
}) {
  return Container(
    width: width ?? 140,
    height: height ?? 150,
    decoration: BoxDecoration(
      color: colordecoration ?? Colors.green,
      borderRadius: BorderRadius.circular(radius ?? 15),
      image: DecorationImage(
          image: NetworkImage(
            url.toString(),
          ),
          fit: BoxFit.cover),
    ),
    child: child,
  );
}

Widget buildText(
    {String? data, int? maxLines, TextOverflow? overflow, TextStyle? style}) {
  return Text(
    data.toString(),
    maxLines: maxLines,
    overflow: overflow,
    style: style,
  );
}
