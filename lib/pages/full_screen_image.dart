import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gesture_zoom_box/gesture_zoom_box.dart';

import 'package:twitter_clone/theme/colors.dart';

import '../icons.dart';

class FullScreenImage extends StatefulWidget {
  final String image;

  const FullScreenImage({Key? key, required this.image}) : super(key: key);

  @override
  State<FullScreenImage> createState() => _FullScreenImageState();
}

class _FullScreenImageState extends State<FullScreenImage>
    with SingleTickerProviderStateMixin {
  TransformationController transformationController =
      TransformationController();
  // TapDownDetails tapDownDetails = TapDownDetails();
  late AnimationController animationController;
  // var animation;

  bool isOnTap = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    // ..addListener(() {
    //   transformationController.value = animation.value;
    // });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  // onDoubleTapDown(TapDownDetails details) {
  //   tapDownDetails = details;
  // }

  // onDoubleTap() {
  //   Matrix4 endMatrix;
  //   if (transformationController.value != Matrix4.identity()) {
  //     endMatrix = Matrix4.identity();
  //   } else {
  //     final position = tapDownDetails.localPosition;
  //     endMatrix = Matrix4.identity()
  //       ..translate(-position.dx, -position.dy)
  //       ..scale(1.5);
  //   }
  //   animation =
  //       Matrix4Tween(begin: transformationController.value, end: endMatrix)
  //           .animate(
  //     CurveTween(curve: Curves.fastLinearToSlowEaseIn)
  //         .animate(animationController),
  //   );
  //   animationController.forward(from: 0);
  // }

  @override
  Widget build(BuildContext context) {
    void showContextMenu(BuildContext context) async {
      await showMenu(
        context: context,
        position: RelativeRect.fromDirectional(
            textDirection: TextDirection.rtl,
            start: 25,
            top: 70,
            end: 90,
            bottom: 0),
        items: [
          PopupMenuItem(
            onTap: () {},
            child: Text(
              'Kaydet',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          )
        ],
      );
    }

    return Scaffold(
      body: GestureDetector(
        onTap: (() {
          setState(() {
            isOnTap = !isOnTap;
          });
        }),
        // onDoubleTap: onDoubleTap,
        // onDoubleTapDown: onDoubleTapDown,
        child: Stack(
          children: [
            InteractiveViewer(
              transformationController: transformationController,
              minScale: 1.0,
              maxScale: 2.6,
              panEnabled: false,
              scaleEnabled: true,
              child: GestureZoomBox(
                duration: const Duration(milliseconds: 50),
                doubleTapScale: 3.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    color: AppColors.white.withOpacity(isOnTap == true ? 0 : 1),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_rounded,
                      size: 35,
                    )),
              ),
            ),
            Positioned(
              top: 30,
              right: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onPressed: () => showContextMenu(context),
                    icon: Icon(
                      Icons.more_horiz_rounded,
                      color:
                          AppColors.white.withOpacity(isOnTap == true ? 0 : 1),
                      size: 35,
                    )),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Row(
                children: [cardIconRow],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget get cardIconRow => Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(isOnTap == true ? 0 : 0.7)),
        width: MediaQuery.of(context).size.width,
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              iconLabelButton('2', AppIcons.comments),
              iconLabelButton('34', AppIcons.retweet),
              iconLabelButton('433', AppIcons.like),
              iconLabelButton('26562', AppIcons.views),
              iconLabelButton('', AppIcons.share),
            ],
          ),
        ),
      );

  Widget iconLabel(String text, String icon) => Wrap(
        runAlignment: WrapAlignment.center,
        spacing: 8,
        children: [
          SvgPicture.string(
            icon,
            color: AppColors.white.withOpacity(isOnTap == true ? 0 : 1),
            height: 18,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: AppColors.white.withOpacity(isOnTap == true ? 0 : 1)),
          ),
        ],
      );

  Widget iconLabelButton(String text, String icon) => InkWell(
        child: iconLabel(text, icon),
        onTap: () {},
      );
}
