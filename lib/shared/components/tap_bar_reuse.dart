import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/constants.dart';
import 'package:la_vie/shared/components/reuse_functions.dart';
import 'package:la_vie/shared/themes/colors.dart';

class TapBarReUse extends StatelessWidget {
  final int? initialIndex;
  final List<String>? listOfTabsText;
  final List<Widget>? listOfViewsBody;
  final Function(int)? onChange;

  const TapBarReUse({
    Key? key,
    required this.initialIndex,
    required this.listOfTabsText,
    required this.listOfViewsBody,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ContainedTabBarView(
      initialIndex: initialIndex!,
      tabBarProperties: TabBarProperties(
        indicatorSize: TabBarIndicatorSize.tab,
        height: 40,
        isScrollable: true,
        padding: const EdgeInsets.symmetric(
          horizontal: paddingMedium,
        ),
        labelPadding: const EdgeInsets.symmetric(
          horizontal: paddingMedium,
        ),
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
        indicator: BoxDecoration(
          border: Border.all(
            color: MyColors.cPrimary,
            width: 3,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(borderRadiusMedium),
          ),
        ),
        unselectedLabelColor: MyColors.cTextSubtitleLight,
      ),
      tabs: List.generate(
        listOfTabsText!.length,
        (index) => Container(
          height: 100,
          alignment: AlignmentDirectional.center,
          padding: initialIndex != index
              ? const EdgeInsets.symmetric(
                  horizontal: paddingLarge,
                )
              : EdgeInsets.zero,
          decoration: initialIndex != index
              ? BoxDecoration(
                  color: MyColors.cTextSubtitleLight.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(borderRadiusMedium),
                  ),
                )
              : null,
          child: Text(
            listOfTabsText![index].tr().toTitleCase(),
          ),
        ),
      ),
      views: List.generate(
        listOfTabsText!.length,
        (index) => listOfViewsBody![index],
      ),
      onChange: onChange,
    );
  }
}
