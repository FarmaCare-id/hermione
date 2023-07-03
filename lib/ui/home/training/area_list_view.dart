import 'package:farmacare/constants/colors.dart';
import 'package:flutter/material.dart';

class AreaListView extends StatefulWidget {
  const AreaListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  @override
  _AreaListViewState createState() => _AreaListViewState();
}

class _AreaListViewState extends State<AreaListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<String> areaListData = <String>[
    'assets/icons/ic_drugs.png',
    'assets/icons/ic_wiki.png',
    'assets/icons/ic_assistant.png',
    'assets/icons/ic_delivery.png',
    'assets/icons/ic_appointment.png',
    'assets/icons/ic_community.png',
    'assets/icons/ic_feedback.png',
  ];

  List<String> areaNameData = <String>[
    'Drugs',
    'Wiki',
    'Assistant',
    'Delivery',
    'Appointment',
    'Community',
    'Feedback',
  ];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: GridView(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: List<Widget>.generate(
                    areaListData.length,
                    (int index) {
                      final int count = areaListData.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      animationController?.forward();
                      return Stack(
                      alignment: Alignment.center,
                      children: [
                        AreaView(
                          imagepath: areaListData[index],
                          animation: animation,
                          animationController: animationController!,
                        ),
                        Positioned(
                          bottom: 7,
                          child: Text(
                            areaNameData[index], // Replace with the desired text
                            style: TextStyle(
                              fontFamily: AppColors.fontName,
                              fontSize: 14,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 24.0,
                    childAspectRatio: 1.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AreaView extends StatelessWidget {
  const AreaView({
    Key? key,
    this.imagepath,
    this.animationController,
    this.animation,
  }) : super(key: key);

  final String? imagepath;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: AppColors.grey.withOpacity(0.4),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Material(
                color: AppColors.bluePeriwinkle,
                borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                child: InkWell(
                  focusColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  splashColor: AppColors.nearlyDarkBlue.withOpacity(0.2),
                  onTap: () {
                    // TODO: Add navigation
                    print('AreaView');
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        child: Image.asset(imagepath!),
                      ),
                      // Text(
                      //   'Area',
                      //   textAlign: TextAlign.center,
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.w600,
                      //     fontSize: 12,
                      //     letterSpacing: 0.27,
                      //     color: AppColors.nearlyDarkBlue,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
