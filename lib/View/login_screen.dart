import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urun_katalog_projesi_piton/View/home_screen.dart';
import 'package:urun_katalog_projesi_piton/View/register_screen.dart';
import 'package:urun_katalog_projesi_piton/bloc/login_state.dart';
import 'package:urun_katalog_projesi_piton/constants/color_constants.dart';
import 'package:urun_katalog_projesi_piton/constants/string_constants.dart';
import 'package:urun_katalog_projesi_piton/extensions/validation/form_validations.dart';
import 'package:urun_katalog_projesi_piton/repositories/auth_repository.dart';
import 'package:urun_katalog_projesi_piton/res/components/rectangle_orange_button.dart';
import 'package:urun_katalog_projesi_piton/themes/text_theme.dart';

import '../bloc/login_cubit.dart';
import '../constants/assets_constants.dart';
import '../res/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  bool checkedValue = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

        create: (context) => LoginCubit(AuthRepository()),
        child: loginView(context));
  }

  GestureDetector loginView(BuildContext context) {
    return GestureDetector(
    onTap: () => FocusScope.of(context).unfocus(),
    child: Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, Object? state) async {
          if(state is LoginCompleted){
            if(state.response.actionLogin!.message == 'credentials_error'){
              Utils.toastMessage('Wrong username/password');
            }
            else if(state.response.actionLogin!.token != ''){
              if(checkedValue == true){
                final SharedPreferences sp = await SharedPreferences.getInstance();
                sp.setString('rememberMe', state.response.actionLogin!.token.toString());
              } else{
                final SharedPreferences sp = await SharedPreferences.getInstance();
                sp.remove('rememberMe');
              }
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => HomeScreen()));
            }
          }
          else if(state is LoginError){
            print('Wrong username/password');
            Utils.toastMessage('An Error Occured While Trying To Login');
          }
        },
        builder: (BuildContext context, state) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 40.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        AssetPath.kLogoStroke,
                        width: 100.w,
                        height: 65.h,
                        // height: context.dynamicWidth(0.80),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 115.h,
                    ),
                    Text(
                      CustomString.kWelcomeBack,
                      style: CustomTextStyle.headline2,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(CustomString.kLoginTitle,
                        style: CustomTextStyle.headline1),
                    SizedBox(
                      height: 80.h,
                    ),
                    Text(CustomString.kEmail, style: CustomTextStyle.headline3),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        // keyboardType: TextInputType.emailAddress,
                        focusNode: emailFocusNode,
                        validator: (value) => value?.validateEmail(value),
                        decoration: const InputDecoration(
                          hintText: CustomString.kLoginMailHint,
                        ),
                        onFieldSubmitted: (value) {
                          Utils.fieldFocusChange(
                              context, emailFocusNode, passwordFocusNode);
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(CustomString.kPassword, style: CustomTextStyle.headline3),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.h,
                      ),
                      child: ValueListenableBuilder(
                          valueListenable: _obsecurePassword,
                          builder: (context, value, child) {
                            return TextFormField(
                              controller: _passwordController,
                              obscureText: _obsecurePassword.value,
                              focusNode: passwordFocusNode,
                              validator: (value) => value?.validatePassword(value),
                              decoration: InputDecoration(
                                  hintStyle: _obsecurePassword.value
                                      ? GoogleFonts.manrope(
                                    color: ColorConstants.blackTextColor
                                        .withOpacity(0.4),
                                    letterSpacing: -4.sp,
                                    fontSize: 25.sp,
                                  )
                                      : GoogleFonts.manrope(
                                    color: ColorConstants.blackTextColor
                                        .withOpacity(0.4),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.sp,
                                  ),
                                  hintText: _obsecurePassword.value
                                      ? CustomString.kLoginPwHintHide
                                      : CustomString.kLoginPwHintShow,
                                  contentPadding: _obsecurePassword.value
                                      ? EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 8.h)
                                      : EdgeInsets.symmetric(
                                      horizontal: 16.w, vertical: 14.h),
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        _obsecurePassword.value =
                                        !_obsecurePassword.value;
                                      },
                                      child: _obsecurePassword.value
                                          ? Icon(
                                        Icons.visibility_off_outlined,
                                        color: ColorConstants.blackTextColor
                                            .withOpacity(0.4),
                                      )
                                          : Icon(
                                        Icons.visibility,
                                        color: ColorConstants.darkPurpleColor,
                                      )),
                                  suffixIconColor: ColorConstants.darkPurpleColor),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    SizedBox(
                      height: 17.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.5.w),
                            child: LabeledCheckbox(
                              label: CustomString.kRememberMe,
                              padding: EdgeInsets.zero,
                              value: checkedValue,
                              onChanged: (bool newValue) {
                                setState(() {
                                  checkedValue = newValue;
                                });
                              },
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                            },
                            child: Text(
                              CustomString.kRegister,
                              style: CustomTextStyle.subtitle1,
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    RectangleOrangeButton(
                      loading: state is LoginLoading,
                        title: CustomString.kLogin,
                        onPress: () async {
                          if(_formKey.currentState!.validate()){
                            BlocProvider.of<LoginCubit>(context).login(
                                _emailController.text.toString(), _passwordController.text.toString(), context
                            );
                          }
                        })
                  ],
                ),
              ),
            ),
          );
        },

      )),
  );
  }
}

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Container(
        padding: padding,
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 15.w,
              height: 15.h,
              child: Transform.scale(
                scale: 0.8,
                child: Checkbox(
                  value: value,
                  onChanged: (bool? newValue) {
                    onChanged(newValue);
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.5.w),
              child: Text(
                label,
                style: CustomTextStyle.subtitle1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
