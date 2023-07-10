import 'dart:math';

import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/utils/device/device_utils.dart';
import 'package:farmacare/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:farmacare/models/doctor/doctor.dart';
import 'package:farmacare/data/local/datasources/doctor/doctor_datadummy.dart';

class AppointmentScreen extends StatefulWidget {
  AppointmentScreen({Key? key}) : super(key: key);

  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  late List<DoctorModel> doctorDataList;
  @override
  void initState() {
    doctorDataList = doctorMapList.map((x) => DoctorModel.fromJson(x)).toList();
    super.initState();
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Theme.of(context).backgroundColor,
      leading: Icon(
        Icons.short_text,
        size: 30,
        color: Colors.black,
      ),
      actions: <Widget>[
        Icon(
          Icons.notifications_none,
          size: 30,
          color: AppColors.grey,
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          child: Container(
            // height: 40,
            // width: 40,
            decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
            ),
            child: Image.asset(
              'assets/images/userImage.png', fit: BoxFit.fill,),
          ),
        ) // TODO: .p(8)
      ],
      toolbarHeight: kToolbarHeight,
    );
  }

  Widget _header() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Hello,",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.black800),
        ),
        Text(
          "Eugenius Vicky Wijaksara",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.black800),
        )
      ],
    ); // TODO: .p(16);
  }

  Widget _searchField() {
    return Container(
      height: 55,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(13)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColors.grey.withOpacity(.3),
            blurRadius: 15,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(
            fontSize: 16,
            color: AppColors.grey,
          ),
          suffixIcon: SizedBox(
              width: 50,
              child: Icon(
                Icons.search, color: AppColors.bluePeriwinkle,
                // TOOD: alignCenter & ripple, borderradius
              )),
        ),
      ),
    );
  }

  Widget _category() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8, right: 16, left: 16, bottom: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Category",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black800)),
              Text("See All",
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.bluePeriwinkle)
                  // TODO: .p(8), ripple
                  )
            ],
          ),
        ),
        SizedBox(
          height: DeviceUtils.getScaledHeight(context, 0.28),
          width: DeviceUtils.getScaledWidth(context, 1),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _categoryCard("Chemist & Drugist", "350 + Stores",
                  color: AppColors.blue600, AppColors: AppColors.blue600),
              _categoryCard("Covid - 19 Specialist", "899 Doctors",
                  color: AppColors.nearlyDarkBlue,
                  AppColors: AppColors.blue200),
              _categoryCard("Cardiologists Specialist", "500 + Doctors",
                  color: AppColors.orange400, AppColors: AppColors.orange400),
              _categoryCard("Dermatologist", "300 + Doctors",
                  color: AppColors.blue600, AppColors: AppColors.blue600),
              _categoryCard("General Surgeon", "500 + Doctors",
                  color: AppColors.nearlyDarkBlue, AppColors: AppColors.blue200)
            ],
          ),
        ),
      ],
    );
  }

  Widget _categoryCard(String title, String subtitle,
      {required Color color, required Color AppColors}) {
    TextStyle titleStyle = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    // TextStyle subtitleStyle = TextStyles(
    //   fontSize: 12,
    //   fontWeight: FontWeight.bold,
    // );
    if (DeviceUtils.getScaledWidth(context, 1) < 392) {
      titleStyle = TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      );
      // subtitleStyle = TextStyles(
      //   fontSize: 10,
      //   fontWeight: FontWeight.bold,
      // );
    }
    return AspectRatio(
      aspectRatio: 6 / 8,
      child: Container(
        height: 280,
        width: DeviceUtils.getScaledWidth(context, 0.4),
        margin: EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 10,
              color: AppColors.withOpacity(.8),
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          child: Container(
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -20,
                  left: -20,
                  child: CircleAvatar(
                    backgroundColor: AppColors,
                    radius: 60,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Flexible(
                      child: Text(title, style: titleStyle),
                    // ).hP8,
                    ),
                    SizedBox(height: 10),
                    Flexible(
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      // TODO: .hP(8),
                      )
                    ),
                  ],
                // TODO: .p(16),
                )
              ],
            ),
          ),
        // TODO: ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20)))
        ),
      ),
    );
  }

  Widget _doctorsList() {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Top Doctors", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.black800)),
              IconButton(
                  icon: Icon(
                    Icons.sort,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {})
              // .p(12).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(20))),
            ],
          // hP16,
          ),
          getdoctorWidgetList()
        ],
      ),
    );
  }

  Widget getdoctorWidgetList() {
    return Column(
        children: doctorDataList.map((x) {
      return _doctorTile(x);
    }).toList());
  }

  Widget _doctorTile(DoctorModel model) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(4, 4),
            blurRadius: 10,
            color: AppColors.grey.withOpacity(.2),
          ),
          BoxShadow(
            offset: Offset(-3, 0),
            blurRadius: 15,
            color: AppColors.grey.withOpacity(.1),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        child: ListTile(
          contentPadding: EdgeInsets.all(0),
          leading: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(13)),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: randomColor(),
              ),
              child: Image.asset(
                model.image,
                height: 50,
                width: 50,
                fit: BoxFit.contain,
              ),
            ),
          ),
          title: Text(model.name, style: TextStyle()),
          subtitle: Text(
            model.type,
            style: TextStyle(fontSize: 12, color: AppColors.grey),
          ),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: Theme.of(context).primaryColor,
          ),
          onTap: () {
            // redirect to DoctorDetailScreen
            Navigator.pushNamed(context, Routes.doctorDetail, arguments: model);
          },
        ),
        // .ripple(() {
      //   Navigator.pushNamed(context, "/DetailPage", arguments: model);
      // }, borderRadius: BorderRadius.all(Radius.circular(20))),
      )
    );
  }

  Color randomColor() {
    var random = Random();
    final colorList = [
      Theme.of(context).primaryColor,
      AppColors.orange400,
      AppColors.blue600,
      AppColors.grey,
      AppColors.orange400,
      AppColors.nearlyDarkBlue,
      AppColors.greyLabel,
      Colors.red,
      Colors.brown,
      AppColors.bluePeriwinkle,
      AppColors.nearlyDarkBlue,
    ];
    var color = colorList[random.nextInt(colorList.length)];
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appBar(),
      appBar: AppBar(
        title: Text("Appointment"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // _header(),
                _searchField(),
                _category(),
              ],
            ),
          ),
          _doctorsList()
        ],
      ),
    );
  }
}
