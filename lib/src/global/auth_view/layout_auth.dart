import 'package:flutter/material.dart';
import 'package:marka/src/global/auth_view/login_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'register_view.dart';

class LayoutAuth extends StatefulWidget {
  const LayoutAuth({super.key});

  @override
  State<LayoutAuth> createState() => _LayoutAuthState();
}

class _LayoutAuthState extends State<LayoutAuth> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: const [
                LoginView(),
                RegisterView(),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: _pageController,
            count: 2,
            effect: const ExpandingDotsEffect(
              dotWidth: 10,
              dotHeight: 10,
              dotColor: Colors.grey,
              activeDotColor: Colors.black,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
