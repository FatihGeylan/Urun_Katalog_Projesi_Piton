import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:urun_katalog_projesi_piton/bloc/Products_state.dart';
import 'package:urun_katalog_projesi_piton/bloc/categories_cubit.dart';
import 'package:urun_katalog_projesi_piton/bloc/categories_state.dart';
import 'package:urun_katalog_projesi_piton/bloc/poduct_image_state.dart';
import 'package:urun_katalog_projesi_piton/bloc/product_image_cubit.dart';
import 'package:urun_katalog_projesi_piton/bloc/products_cubit.dart';
import 'package:urun_katalog_projesi_piton/constants/color_constants.dart';
import 'package:urun_katalog_projesi_piton/repositories/products_repository.dart';

import '../constants/assets_constants.dart';
import '../constants/string_constants.dart';
import '../repositories/categories_repository.dart';
import '../themes/text_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesCubit>(
        create: (BuildContext context) =>
            CategoriesCubit(CategoriesRepository())..GetCategories(),
        child: HomeView(),
      );
      // BlocProvider<ProductsCubit>(
      //   create: (BuildContext context) =>
      //       ProductsCubit(ProductsRepository())..GetProducts(1),
      // ),
  }

  Scaffold HomeView() {
    return Scaffold(
        body: BlocConsumer<CategoriesCubit,CategoriesState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        if (state is CategoriesLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is CategoriesCompleted) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20.w, 40.h, 20.w, 20.h),
                  decoration: BoxDecoration(boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: ColorConstants.lightPurpleColor,
                        offset: Offset(0.0, 1))
                  ], color: ColorConstants.whiteColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        AssetPath.kLogoStroke,
                        width: 50.w,
                        height: 32.h,
                        // height: context.dynamicWidth(0.80),
                        fit: BoxFit.contain,
                      ),
                      Text(CustomString.kCatalog,
                          style: CustomTextStyle.headline1),
                    ],
                  ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: SizedBox(
                    height: 42.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            state.response.categories![index].name.toString(),
                            style: CustomTextStyle.subtitle8,
                          ),
                        ),
                      ),
                      itemCount: state.response.categories!.length,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: CustomString.kSearch,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: SvgPicture.asset(AssetPath.kFilterSvg,
                            width: 16.w, height: 16.h, fit: BoxFit.scaleDown),
                        contentPadding: EdgeInsets.symmetric(vertical: 14.h)),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.response.categories![index].name.toString(),
                                style: CustomTextStyle.headline1),
                            Text(CustomString.kViewAll, style: CustomTextStyle.subtitle9)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 187.h,
                        child: BlocProvider<ProductsCubit>(
                          create: (BuildContext context) =>
                              ProductsCubit(ProductsRepository())..GetProducts(state.response.categories![index].id!),
                          child: BlocConsumer<ProductsCubit,ProductsState>(
                            listener: (BuildContext context, state) {
                            },
                            builder: (BuildContext context, Object? productsState) {
                              if(productsState is ProductsLoading || productsState is ProductsInitial){
                                return Center(
                                  child: SizedBox(
                                      width: 30.w,
                                      height: 30.h,
                                      child: CircularProgressIndicator()
                                  ),
                                );
                              }
                              else if(productsState is ProductsCompleted){
                                return ListView.builder(
                                  shrinkWrap: true,
                                  addAutomaticKeepAlives: true,
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  itemCount: productsState.response.product!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(20.w, 20.h, 0, 20.h),
                                      child: Container(
                                        height: 140.h,
                                        width: 210.w,
                                        padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.h),
                                        color: ColorConstants.lightPurpleColor,
                                        child: Row(
                                          children: [
                                            BlocProvider<ProductImageCubit>(
                                              create: (BuildContext context) =>
                                              ProductImageCubit(ProductsRepository())..GetProductImage(productsState.response.product![index].cover.toString()),
                                              child: BlocConsumer<ProductImageCubit, ProductImageState>(
                                                listener: (BuildContext context, state) {  },
                                                builder: (BuildContext context, Object? imageState) {
                                                  if(imageState is ProductImageInitial || imageState is ProductImageLoading){
                                                    return SizedBox(
                                                      height: 20.h,
                                                        width: 20.w,
                                                        child: CircularProgressIndicator()
                                                    );
                                                  }
                                                  else if(imageState is ProductImageCompleted){
                                                    return SizedBox(
                                                      width: 80.w,
                                                        height: 120.h,
                                                        child: Image.network(imageState.response.actionProductImage!.url.toString(), fit: BoxFit.cover,)
                                                    );
                                                  }
                                                  else{
                                                    return Center(child: Text('ERROR'));
                                                  }
                                                },

                                              ),
                                            ),
                                            Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10.w, top: 20.h),
                                                  child: SizedBox(
                                                    width: 100.w,
                                                    child: Text(productsState.response.product![index].name.toString(),
                                                      style: CustomTextStyle.subtitle2,),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10.w, top: 4.h),
                                                  child: SizedBox(
                                                    width: 100.w,
                                                    child: Text(productsState.response.product![index].author.toString(),
                                                      style: CustomTextStyle.subtitle3,),
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 10.w, bottom: 20.h),
                                                  child: SizedBox(
                                                    width: 100.w,
                                                    child: Text(productsState.response.product![index].price.toString() + '\$',
                                                      style: CustomTextStyle.subtitle4,),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );

                              }
                              else{
                                return Center(child: Text('ERROR'));
                              }
                            },

                          ),
                        ),
                      ),
                      SizedBox(height: 20.h,)
                    ],
                  ),
                  itemCount: state.response.categories!.length,
                ),
              ],
            ),
          );
        } else {
          return Center(child: Text('ERROR'));
        }
      },
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
