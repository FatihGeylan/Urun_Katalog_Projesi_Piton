import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urun_katalog_projesi_piton/View/home_screen.dart';
import 'package:urun_katalog_projesi_piton/View/login_screen.dart';
import 'package:urun_katalog_projesi_piton/bloc/splash_cubit.dart';
import 'package:urun_katalog_projesi_piton/bloc/splash_state.dart';
import 'package:urun_katalog_projesi_piton/constants/assets_constants.dart';
import 'package:urun_katalog_projesi_piton/constants/color_constants.dart';
import 'package:urun_katalog_projesi_piton/constants/string_constants.dart';
import 'package:urun_katalog_projesi_piton/themes/text_theme.dart';

import '../res/components/rectangle_orange_button.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashCubit()..LeaveSplash(),
      child: buildScaffold(context),
    );
  }

  Scaffold buildScaffold(BuildContext context) => Scaffold(
    body: BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) async {
        if (state is SplashCompleted) {
          final SharedPreferences sp = await SharedPreferences.getInstance();
          if(sp.getString('rememberMe') != null ){
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => HomeScreen()));
          }
          else{
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => LoginScreen()));
          }
        }
      },
      builder: (context, state) {
        return buildSplash(context);
      },
    ),
  );

  Container buildSplash(BuildContext context) {
    return Container(
      color: ColorConstants.splashBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          Expanded(
              child: SizedBox(
                child: Image.asset(
                  AssetPath.kLogoStroke,
                  width: 200.w,
                  height: 130.h,
                  // height: context.dynamicWidth(0.80),
                  fit: BoxFit.contain,

                ),
              )
          ),
          RectangleOrangeButton(title: CustomString.kLogin, onPress: (){
            Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => LoginScreen()));
          }),
          SizedBox(
            width: double.infinity,
            height: 60.h,
            child: TextButton(
              onPressed: () {  },
              child: Text(CustomString.kSkip, style: CustomTextStyle.headline7),

            ),
          )
        ],
      ),
    );
  }

}
