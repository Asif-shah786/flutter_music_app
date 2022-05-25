import 'package:flutter/material.dart';

ListTile buildListTile({
  int? trackId,
  required String title,
  required String subTitle,
  Widget? leading,
  String? trailing,
  VoidCallback? onTap,
}) {
  return ListTile(
    leading: leading,
    onTap: onTap ?? null,
    title: SizedBox(
        width: 70,
        child: Text(
          title,
          softWrap: true,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )),
    subtitle: SizedBox(
        width: 60,
        child: Text(subTitle,
            softWrap: true,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black,
            ))),
    trailing: trailing == null
        ? null
        : SizedBox(
            width: 60,
            child: Text(
              trailing,
              softWrap: true,
            ),
          ),
  );
}
