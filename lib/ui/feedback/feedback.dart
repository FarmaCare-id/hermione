import 'package:farmacare/constants/colors.dart';
import 'package:farmacare/utils/device/device_utils.dart';
import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isLightMode = brightness == Brightness.light;
    return Container(
      color: isLightMode ? AppColors.nearlyWhite : AppColors.nearlyBlack,
      child: SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor:
              isLightMode ? AppColors.nearlyWhite : AppColors.nearlyBlack,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top,
                        left: 16,
                        right: 16),
                    child: Image.asset('assets/images/feedbackImage.png'),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      'Your FeedBack',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: isLightMode ? Colors.black : Colors.white),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      'Give your best time for this moment.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16,
                          color: isLightMode ? Colors.black : Colors.white),
                    ),
                  ),
                  _buildComposerIsu(),
                  _buildComposerCategory(),
                  _buildComposer(),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Container(
                        width: DeviceUtils.getScaledWidth(context, 0.85),
                        height: DeviceUtils.getScaledHeight(context, 0.05),
                        decoration: BoxDecoration(
                          color: isLightMode ? Colors.blue : Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                offset: const Offset(4, 4),
                                blurRadius: 8.0),
                          ],
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                            },
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Send',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: isLightMode
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComposerIsu() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 40, maxHeight: 160),
            color: AppColors.white,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: TextField(
                maxLines: null,
                onChanged: (String txt) {
                  // TODO: implement
                },
                style: TextStyle(
                  fontFamily: AppColors.fontName,
                  fontSize: 16,
                  color: AppColors.dark_grey,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Issue'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComposerCategory() {
  return Padding(
    padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            offset: const Offset(4, 4),
            blurRadius: 8,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.all(4.0),
          constraints: const BoxConstraints(minHeight: 40, maxHeight: 160),
          color: AppColors.white,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
            child: DropdownButtonFormField<String>(
              onChanged: (String? selectedValue) {
                // TODO: implement
              },
              items: <DropdownMenuItem<String>>[
                DropdownMenuItem(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                DropdownMenuItem(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
                DropdownMenuItem(
                  value: 'Option 3',
                  child: Text('Option 3'),
                ),
              ],
              hint: Text('Select category'),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}


  Widget _buildComposer() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.withOpacity(0.8),
                offset: const Offset(4, 4),
                blurRadius: 8),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            padding: const EdgeInsets.all(4.0),
            constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
            color: AppColors.white,
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
              child: TextField(
                maxLines: null,
                onChanged: (String txt) {
                  // TODO: implement
                },
                style: TextStyle(
                  fontFamily: AppColors.fontName,
                  fontSize: 16,
                  color: AppColors.dark_grey,
                ),
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your feedback...'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
