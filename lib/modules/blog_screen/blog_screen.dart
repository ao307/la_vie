import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/modules/blog_screen/blog_widgets/blogs_plant_item.dart';
import 'package:la_vie/modules/blog_screen/blog_widgets/blogs_seeds_item.dart';
import 'package:la_vie/modules/blog_screen/blog_widgets/blogs_tools_item.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/components/widgets.dart';
import 'package:la_vie/shared/cubit/products_cubit/products_cubit.dart';
import '../../shared/cubit/products_cubit/products_states.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsCubit productsCubit = ProductsCubit.get(context);
    return FutureBuilder(
      future: productsCubit.getBlogs(),
      builder: (context, snapshot) {
        return BlocConsumer<ProductsCubit, ProductsStates>(
          listener: (context, state) {},
          builder: (context, state) {
            if (snapshot.connectionState == ConnectionState.waiting &&
                productsCubit.blogsModel == null) {
              return LoadingPage(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('blogs'.tr().toCapitalized()),
                ),
              );
            } else if (productsCubit.blogsModel == null || snapshot.hasError) {
              return ErrorPage(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text('blogs'.tr().toCapitalized()),
                ),
              );
            }
            final toLengthIf = productsCubit.blogsModel!.data;
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('blogs'.tr().toCapitalized()),
              ),
              body: toLengthIf!.seeds!.isNotEmpty &&
                      toLengthIf.plants!.isNotEmpty &&
                      toLengthIf.tools!.isNotEmpty
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                productsCubit.blogsModel!.data!.plants!.length,
                            padding: const EdgeInsetsDirectional.all(
                              paddingLarge,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: paddingLarge,
                            ),
                            itemBuilder: (BuildContext context, int index) =>
                                BlogsPlantItem(
                              model: productsCubit
                                  .blogsModel!.data!.plants![index],
                            ),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                productsCubit.blogsModel!.data!.seeds!.length,
                            padding: const EdgeInsetsDirectional.all(
                              paddingLarge,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: paddingLarge,
                            ),
                            itemBuilder: (BuildContext context, int index) =>
                                BlogsSeedItem(
                              model:
                                  productsCubit.blogsModel!.data!.seeds![index],
                            ),
                          ),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount:
                                productsCubit.blogsModel!.data!.tools!.length,
                            padding: const EdgeInsetsDirectional.all(
                              paddingLarge,
                            ),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(
                              height: paddingLarge,
                            ),
                            itemBuilder: (BuildContext context, int index) =>
                                BlogsToolsItem(
                              model:
                                  productsCubit.blogsModel!.data!.tools![index],
                            ),
                          ),
                        ],
                      ),
                    )
                  : const EmptyWidget(),
            );
          },
        );
      },
    );
  }
}
