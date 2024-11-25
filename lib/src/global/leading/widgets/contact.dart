import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marka/app.dart';
import 'package:marka/core/router/router.dart';

class GetCardsContent extends StatelessWidget {
  final String image, cardContent;
  double? height, width;
  bool? lastPage;

   GetCardsContent({
    super.key,
    this.cardContent = '',
    this.width,
    this.height,
    this.lastPage=false,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            12.h.verticalSpace,
            ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              child: Image(image: AssetImage(image),),
            ),
            12.h.verticalSpace,
            Text(
              cardContent,
              
            ),80.h.verticalSpace,
            lastPage == true
                ? const SizedBox()
                : Center(
                  child: GestureDetector(
                      onTap: () {
                        Get.offAllNamed(AppRouter.LAYOUTAUTH);
                      },
                    child: Container(
                      height: 50.0.sp,
                      width: 200.0.sp,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        //color: Theme.of(context).colorScheme.secondary,
                        border: Border.all(
                          color: Theme.of(context).colorScheme.onSecondary,
                          width: 1.0,
                        )
                      ),
                      child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get Started',
                          ),
                          Icon(
                              Icons.arrow_forward_ios,
                             
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
