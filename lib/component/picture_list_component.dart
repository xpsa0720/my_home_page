import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class PictureListComponent extends StatelessWidget {
  final List<List<String>> list;
  final double PictureWidth;
  final double SizedBoxWidth;
  final double SizedBoxHeight;
  const PictureListComponent({
    super.key,
    required this.list,
    required this.PictureWidth,
    required this.SizedBoxWidth,
    required this.SizedBoxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
          list
              .expandIndexed(
                (i, x) => [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:
                        x
                            .expandIndexed(
                              (j, y) => [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.black,
                                    ),
                                  ),
                                  child: Image.asset(
                                    list[i][j],
                                    width: PictureWidth,
                                    gaplessPlayback: true,
                                  ),
                                ),
                                if (j != ((list[i].length) - 1))
                                  SizedBox(width: SizedBoxWidth),
                              ],
                            )
                            .toList(),
                  ),
                  SizedBox(height: SizedBoxHeight),
                ],
              )
              .toList(),
    );
  }
}
