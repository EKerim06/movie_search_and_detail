// ignore_for_file: avoid_multiple_declarations_per_line

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

///Custom movie container
class MyContainer extends StatelessWidget {
  ///Custom movie container
  const MyContainer({
    required this.onPressed,
    super.key,
    this.imageUrl,
    this.height,
    this.width,
    this.title,
    this.description,
    this.descriptionUnder,
    this.descriptionUnderRight,
    this.descriptionUnderRightIcon,
    this.imageWidth,
    this.buttonIcon,
  });

  ///On tap method.
  final VoidCallback onPressed;

  ///image url. if url null or broken whereas default image show.
  ///Is default image N/a icon.
  final String? imageUrl;

  ///container [height] and [width]. if you null is default
  ///[width: double.infinity],[height: context.dynamicHeight(0.15)]
  final double? height, width;

  ///is title null whereas show screen null
  final String? title;

  ///is description null whereas show screen null
  final String? description;

  ///is date? null whereas show screen null
  final String? descriptionUnder;

  ///is rate? null whereas show screen null
  final String? descriptionUnderRight;

  ///is [descriptionUnderRight] icon.
  final IconData? descriptionUnderRightIcon;

  ///is null whereas
  final double? imageWidth;

  ///Icons is icon is defaul value [Icons.home]
  final IconData? buttonIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.padding.low,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? context.sized.dynamicHeight(0.15),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black54,
            strokeAlign: BorderSide.strokeAlignCenter,
          ),
          // boxShadow: const [
          //   BoxShadow(
          //     color: Colors.black45,
          //   ),
          // ],
          // color: Colors.red,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.black12,
                // shape: BoxShape.circle,
                borderRadius: BorderRadius.circular(24),
              ),
              child: imageUrl == null || imageUrl!.contains('N/A')
                  ? Image.asset(
                      'asset/icon/ic_na.png',
                      package: 'widget',
                      width: context.sized.dynamicWidth(0.25),
                      fit: BoxFit.contain,
                    )
                  : Image.network(
                      imageUrl!,
                      width: context.sized.dynamicWidth(0.25),
                      fit: BoxFit.contain,
                      scale: 0.9,
                    ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? 'N/A',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.general.textTheme.bodyLarge?.fontSize,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        description ?? '',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      IconButton(
                        onPressed: onPressed,
                        icon: Icon(buttonIcon ?? Icons.home),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(descriptionUnder ?? ''),
                      context.sized.emptySizedWidthBoxHigh,
                      Text(descriptionUnderRight ?? ''),
                      Icon(descriptionUnderRightIcon),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: context.sized.dynamicWidth(0.2),
            //   child: Text(movieRate ?? ''),
            // ),
          ],
        ),
      ),
    );
  }
}
