import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/models/doctor/doctor.dart';
import 'package:farmacare/utils/device/device_utils.dart';
import 'package:flutter/material.dart';
import 'package:farmacare/widgets/progress_widget.dart';
import 'package:farmacare/widgets/rating_start.dart';

class DoctorDetailScreen extends StatefulWidget {
  DoctorDetailScreen ({Key? key, required this.model}) : super(key: key);
  final DoctorModel model;

  @override
  _DoctorDetailScreenState createState() => _DoctorDetailScreenState();
}

class _DoctorDetailScreenState extends State<DoctorDetailScreen> {
  late DoctorModel model;
  @override
  void initState() {
    model = widget.model;
    super.initState();
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        BackButton(color: Theme.of(context).primaryColor),
        IconButton(
            icon: Icon(
              model.isfavourite ? Icons.favorite : Icons.favorite_border,
              color: model.isfavourite ? Colors.red : AppColors.grey,
            ),
            onPressed: () {
              setState(() {
                model.isfavourite = !model.isfavourite;
              });
            })
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TextStyle titleStyle = TextStyles.title.copyWith(fontSize: 25).bold;
    // if (DeviceUtils.getScaledWidth(context,  1) < 393) {
    //   titleStyle = TextStyles(
    //     fontSize: 25,
    //     fontWeight: FontWeight.bold,
    //   );
    // }
    return Scaffold(
      backgroundColor: AppColors.blue300,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Image.asset(model.image),
            DraggableScrollableSheet(
              maxChildSize: .8,
              initialChildSize: .6,
              minChildSize: .6,
              builder: (context, scrollController) {
                return Container(
                  height: DeviceUtils.getScaledHeight(context, 1) * .5,
                  padding: EdgeInsets.only(left:19,right:19,top: 16),//symmetric(horizontal: 19, vertical: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.all(0),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                model.name,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.check_circle,
                                  size: 18,
                                  color: Theme.of(context).primaryColor),
                              Spacer(),
                              RatingStar(
                                rating: model.rating,
                              )
                            ],
                          ),
                          subtitle: Text(
                            model.type,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: .3,
                          color: AppColors.grey,
                        ),
                        Row(
                          children: <Widget>[
                            ProgressWidget(
                                value: model.goodReviews,
                                totalValue: 100,
                                activeColor: AppColors.bluePeriwinkle,
                                backgroundColor:
                                    AppColors.grey.withOpacity(.3),
                                title: "Good Review",
                                durationTime: 500),
                            ProgressWidget(
                                value: model.totalScore,
                                totalValue: 100,
                                activeColor: AppColors.bluePeriwinkle,
                                backgroundColor:
                                    AppColors.grey.withOpacity(.3),
                                title: "Total Score",
                                durationTime: 300),
                            ProgressWidget(
                                value: model.satisfaction,
                                totalValue: 100,
                                activeColor: AppColors.bluePeriwinkleDark,
                                backgroundColor:
                                    AppColors.grey.withOpacity(.3),
                                title: "Satisfaction",
                                durationTime: 800),
                          ],
                        ),
                        Divider(
                          thickness: .3,
                          color: AppColors.grey,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("About", style: 
                          TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                          ),
                          // vp16.
                        ),
                        SizedBox(
                          height: 10,),
                        Text(
                          model.description,
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.grey,
                          )
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.grey.withAlpha(150)
                              ),
                              child: Icon(Icons.call, color: Colors.white,),
                            // .ripple((){}, borderRadius:BorderRadius.circular(10), )
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.grey.withAlpha(150)
                              ),
                              child: Icon(Icons.chat_bubble, color: Colors.white,),
                            // .ripple((){}, borderRadius:BorderRadius.circular(10), )
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 45,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                                ),
                                onPressed: () {},
                                child: Text("Make an appointment", style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white
                                ),
                                ),
                              ),
                            )
                          ],
                        // .vP16
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
            _appbar(),
          ],
        ),
      ),
    );
  }
}
