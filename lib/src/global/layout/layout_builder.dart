import 'package:flutter/material.dart';
import 'package:marka/src/global/loader/loader_view.dart';

class LayoutBuilders extends StatelessWidget {
  const LayoutBuilders({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const LoaderView();
        } else if (constraints.maxWidth < 1200) {
          return const LoaderView();
        } else {
          return const Scaffold(
            body: Center(
              child: Text('Desktop'),
            ),
          );
        }
      },
    );
  }
}