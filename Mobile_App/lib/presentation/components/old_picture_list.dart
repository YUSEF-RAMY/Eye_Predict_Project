import 'package:eye_app/data/model/old_picture_model.dart';
import 'package:flutter/material.dart';

import 'old_picture.dart';

class OldPictureList extends StatelessWidget {
  final List<OldPictureModel> oldPictures;

  const OldPictureList({super.key, required this.oldPictures});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: oldPictures.length,
        (context, index) => Row(
          children: [
            OldPicture(item: oldPictures[index]),
            SizedBox(width: 8,),
            OldPicture(item: oldPictures[index]),
          ],
        ),
      ),
    );
  }
}
