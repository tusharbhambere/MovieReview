import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:global_template/widgets/reusable/show_image_asset.dart';
import 'package:movie_review/app/constant.dart';
import 'package:velocity_x/velocity_x.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;
  const TopAppBar({Key? key, required this.appBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: ShowImageAsset(
        imageUrl: constant.logoavtar,
        imageCircleRadius: 10,
        isCircle: true,
        padding: EdgeInsets.all(15),
      ),
      title: 'Feed'.text.black.xl2.make(),
      actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.sms)),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBar.preferredSize.height);
}
