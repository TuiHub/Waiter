import 'package:flutter/material.dart';

bool isWideScreen(BuildContext context) {
  const breakpoint = 600;
  return MediaQuery.of(context).size.width >= breakpoint;
}
