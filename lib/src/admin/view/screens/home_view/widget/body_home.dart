import 'package:marka/src/export/expPagckage.dart';

import 'data.dart';
import 'my_diary_screen.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({super.key});

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> with TickerProviderStateMixin {
  AnimationController? animationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

Widget tabBody = Container(
    color: FitnessAppTheme.background,
  );

  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = MyDiaryScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return 
    Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return const Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(),
        ),
        // BottomBarView(
        //   tabIconsList: tabIconsList,
        //   addClick: () {},
        //   changeIndex: (int index) {
        //     if (index == 0 || index == 2) {
        //       animationController?.reverse().then<dynamic>((data) {
        //         if (!mounted) {
        //           return;
        //         }
        //         setState(() {
        //           tabBody =
        //               MyDiaryScreen(animationController: animationController);
        //         });
        //       });
        //     } else if (index == 1 || index == 3) {
        //       animationController?.reverse().then<dynamic>((data) {
        //         if (!mounted) {
        //           return;
        //         }
        //         setState(() {
        //           tabBody =
        //               TrainingScreen(animationController: animationController);
        //         });
        //       });
        //     }
        //   },
        // ),
      ],
    );
    // Column(children: [
    //   Row(
    //     children: [
    //       5.sp.horizontalSpace,
    //       Container(
    //         width: context.mediaQuerySize.width * 0.480,
    //         height: 125.h,
    //         color: Colors.red,
    //       ),
    //       5.sp.horizontalSpace,
    //       Container(
    //         width: context.mediaQuerySize.width * 0.480,
    //         height: 125.h,
    //         color: Colors.green,
    //       ),
          
    //     ],
    //   ),
    //   MediterranesnDietView(
    //         animation: animationController != null
    //             ? Tween<double>(begin: 0.0, end: 1.0).animate(
    //                 CurvedAnimation(
    //                   parent: animationController!,
    //                   curve: Curves.fastOutSlowIn,
    //                 ),
    //               )
    //             : AlwaysStoppedAnimation(0.0),
    //         animationController: animationController,
    //       ),
    // ]);
  }
}




class TrainingScreen extends StatefulWidget {
  const TrainingScreen({super.key, this.animationController});

  final AnimationController? animationController;
  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;          

  List<Widget> listViews = <Widget>[];
  final ScrollController scrollController = ScrollController();
  double topBarOpacity = 0.0;

  @override
  void initState() {
    topBarAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: widget.animationController!,
            curve: const Interval(0, 0.5, curve: Curves.fastOutSlowIn)));
    addAllListData();

    scrollController.addListener(() {
      if (scrollController.offset >= 24) {
        if (topBarOpacity != 1.0) {
          setState(() {
            topBarOpacity = 1.0;
          });
        }
      } else if (scrollController.offset <= 24 &&
          scrollController.offset >= 0) {
        if (topBarOpacity != scrollController.offset / 24) {
          setState(() {
            topBarOpacity = scrollController.offset / 24;
          });
        }
      } else if (scrollController.offset <= 0) {
        if (topBarOpacity != 0.0) {
          setState(() {
            topBarOpacity = 0.0;
          });
        }
      }
    });
    super.initState();
  }

  void addAllListData() {
   
    
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: FitnessAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            getMainListViewUI(),
            getAppBarUI(),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  Widget getMainListViewUI() {
    return FutureBuilder<bool>(
      future: getData(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox();
        } else {
          return ListView.builder(
            controller: scrollController,
            padding: EdgeInsets.only(
              top: AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top +
                  24,
              bottom: 62 + MediaQuery.of(context).padding.bottom,
            ),
            itemCount: listViews.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              widget.animationController?.forward();
              return listViews[index];
            },
          );
        }
      },
    );
  }

  Widget getAppBarUI() {
    return Column(
      children: <Widget>[
        AnimatedBuilder(
          animation: widget.animationController!,
          builder: (BuildContext context, Widget? child) {
            return FadeTransition(
              opacity: topBarAnimation!,
              child: Transform(
                transform: Matrix4.translationValues(
                    0.0, 30 * (1.0 - topBarAnimation!.value), 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: FitnessAppTheme.white.withOpacity(topBarOpacity),
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(32.0),
                    ),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: FitnessAppTheme.grey
                              .withOpacity(0.4 * topBarOpacity),
                          offset: const Offset(1.1, 1.1),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: const Column(
                    children: <Widget>[
                      // SizedBox(
                      //   height: MediaQuery.of(context).padding.top,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(
                      //       left: 16,
                      //       right: 16,
                      //       top: 16 - 8.0 * topBarOpacity,
                      //       bottom: 12 - 8.0 * topBarOpacity),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //       Expanded(
                      //         child: Padding(
                      //           padding: const EdgeInsets.all(8.0),
                      //           child: Text(
                      //             'Training',
                      //             textAlign: TextAlign.left,
                      //             style: TextStyle(
                      //               fontFamily: FitnessAppTheme.fontName,
                      //               fontWeight: FontWeight.w700,
                      //               fontSize: 22 + 6 - 6 * topBarOpacity,
                      //               letterSpacing: 1.2,
                      //               color: FitnessAppTheme.darkerText,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 38,
                      //         width: 38,
                      //         child: InkWell(
                      //           highlightColor: Colors.transparent,
                      //           borderRadius: const BorderRadius.all(
                      //               Radius.circular(32.0)),
                      //           onTap: () {},
                      //           child: const Center(
                      //             child: Icon(
                      //               Icons.keyboard_arrow_left,
                      //               color: FitnessAppTheme.grey,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //       const Padding(
                      //         padding: EdgeInsets.only(
                      //           left: 8,
                      //           right: 8,
                      //         ),
                      //         child: Row(
                      //           children: <Widget>[
                      //             Padding(
                      //               padding: EdgeInsets.only(right: 8),
                      //               child: Icon(
                      //                 Icons.calendar_today,
                      //                 color: FitnessAppTheme.grey,
                      //                 size: 18,
                      //               ),
                      //             ),
                      //             Text(
                      //               '15 May',
                      //               textAlign: TextAlign.left,
                      //               style: TextStyle(
                      //                 fontFamily: FitnessAppTheme.fontName,
                      //                 fontWeight: FontWeight.normal,
                      //                 fontSize: 18,
                      //                 letterSpacing: -0.2,
                      //                 color: FitnessAppTheme.darkerText,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 38,
                      //         width: 38,
                      //         child: InkWell(
                      //           highlightColor: Colors.transparent,
                      //           borderRadius: const BorderRadius.all(
                      //               Radius.circular(32.0)),
                      //           onTap: () {},
                      //           child: const Center(
                      //             child: Icon(
                      //               Icons.keyboard_arrow_right,
                      //               color: FitnessAppTheme.grey,
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // )
                    
                    
                    ],
                  ),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}