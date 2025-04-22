import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:moniepoint_assessment/core/constants/app_assets.dart';
import 'package:moniepoint_assessment/core/constants/app_colors.dart';
import 'package:moniepoint_assessment/core/constants/app_constants.dart';
import 'package:moniepoint_assessment/core/constants/app_strings.dart';
import 'package:moniepoint_assessment/core/extensions/widget_extensions.dart';
import 'package:moniepoint_assessment/ui/map_page/notifier/map_notifier.dart';
import 'package:moniepoint_assessment/ui/map_page/widgets/map_icon_option_tile.dart';
import 'package:moniepoint_assessment/ui/map_page/widgets/map_option_tile.dart';
import 'package:moniepoint_assessment/ui/map_page/widgets/map_search_field.dart';
import 'package:moniepoint_assessment/widgets/page_widgets/app_scaffold.dart';

class MapPage extends ConsumerStatefulWidget {
  const MapPage({super.key});

  @override
  ConsumerState<MapPage> createState() => _MapPageState();
}

class _MapPageState extends ConsumerState<MapPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(mapNotifier.notifier).getCurrentLocation(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      padding: EdgeInsets.zero,
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(
                ref.watch(mapNotifier).currentLocation?.latitude ?? 0.0,
                ref.watch(mapNotifier).currentLocation?.longitude ?? 0.0,
              ),
              zoom: 14.4746,
            ),
            onMapCreated: (GoogleMapController controller) {
              ref.watch(mapNotifier.notifier).setMapController(controller);
            },
            markers: ref.watch(mapNotifier).mapMarkers,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.aw),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                60.sbH,
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const MapSearchField(),
                    8.sbW,
                    Container(
                      height: 50.ah,
                      padding: EdgeInsets.all(15.ar),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.neutralWhite,
                      ),
                      child: SvgPicture.asset(
                        SvgAssets.filterIcon,
                        height: 26.ar,
                        color: AppColors.textBlack,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MapIconOptionTile(
                          icon: SvgAssets.stackIcon,
                          onTap: () => ref.watch(mapNotifier.notifier).showMapFilterPopUpMenu(context),
                        ),
                        8.sbH,
                        MapIconOptionTile(
                          icon: SvgAssets.sendIcon,
                          onTap: () {},
                        ),
                      ],
                    ),
                    MapOptionTile(
                      icon: SvgAssets.listIcon,
                      title: AppStrings.listOfVariants,
                      onTap: () {},
                    ),
                  ],
                ),
                120.sbH,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
