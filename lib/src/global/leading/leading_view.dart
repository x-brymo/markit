import 'package:flutter/material.dart';
import 'package:onboarding_animation/onboarding_animation.dart';

import 'widgets/contact.dart';

class LeadingView extends StatelessWidget {
  const LeadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: OnBoardingAnimation(
        pages: [
          GetCardsContent(
            image: 'asset/image/logo.png',
            cardContent:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          ),
          GetCardsContent(
            image: 'asset/image/logo.png',
            cardContent:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          ),
          GetCardsContent(
            image: 'asset/image/logo.png',
            cardContent:
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
          ),
          GetCardsContent(
              image: 'asset/image/logo.png',
              cardContent:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
              lastPage: true),
        ],
        indicatorDotHeight: 7.0,
        indicatorDotWidth: 7.0,
        indicatorType: IndicatorType.scaleDots,
        indicatorPosition: IndicatorPosition.bottomCenter,
      ),
    );
  }
}
