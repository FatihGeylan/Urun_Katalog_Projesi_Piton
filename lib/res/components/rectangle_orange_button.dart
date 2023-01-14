import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/color_constants.dart';

class RectangleOrangeButton extends StatelessWidget {

  final String title ;
  final bool loading ;
  final VoidCallback onPress ;
  const RectangleOrangeButton({Key? key ,
    required this.title,
    this.loading = false ,
    required this.onPress ,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color(0xFFEF6B4A),
              borderRadius: BorderRadius.circular(4)
          ),
          child: Center(
              child:loading ? CircularProgressIndicator(color: Colors.white,) :  Text(title ,
                style: TextStyle(color: ColorConstants.whiteColor),
              )),
        ),
      ),
    );
  }
}