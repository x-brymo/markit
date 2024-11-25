import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marka/core/router/router.dart';

class LoaderView extends StatefulWidget {
  const LoaderView({super.key});

  @override
  State<LoaderView> createState() => _LoaderViewState();
}

class _LoaderViewState extends State<LoaderView> {
  @override
  void initState() {
    super.initState();
     Future.delayed(const Duration(seconds: 5),
     ()=> Get.offAllNamed(AppRouter.LEADING)
     );
   
  }
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}