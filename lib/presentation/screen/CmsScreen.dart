import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllString.dart';
import '../widget/GlobalWidgets.dart';

class CmsScreen extends StatelessWidget {
  final String? type;
  const CmsScreen({Key? key, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: AllColors.whiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(
            children: [backButton(context), TabTitlesSide(type!)]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(AllDimension.twelve),
          child: Text("Lorem ipsum dolor sit amet consectetur. Ac sit in mi interdum malesuada ante in scelerisque. Odio mauris amet in sed justo scelerisque porttitor elit diam. Maecenas porttitor amet sociis tortor. Justo quis est habitant amet nascetur gravida. Morbi velit feugiat velit fringilla sed dictumst pretium bibendum sem. Volutpat ultricies ultricies purus nunc accumsan scelerisque nibh elit. Pellentesque ultrices tincidunt donec lobortis sit blandit. Diam scelerisque sed sed diam ultricies nibh adipiscing dapibus. Platea ac vitae ac egestas eget praesent. Bibendum vitae turpis consectetur adipiscing faucibus bibendum cursus turpis. Sollicitudin tellus urna feugiat nunc sed orci elit sagittis gravida. Facilisis nibh ipsum mauris urna vestibulum molestie ac tellus. Dignissim mauris lacus nec vitae iaculis aliquam erat aliquam. Tortor senectus tellus commodo vel.Lorem ipsum dolor sit amet consectetur. Ac sit in mi interdum malesuada ante in scelerisque. Odio mauris amet in sed justo scelerisque porttitor elit diam. Maecenas porttitor amet sociis tortor. Justo quis est habitant amet nascetur gravida. Morbi velit feugiat velit fringilla sed dictumst pretium bibendum sem. Volutpat ultricies ultricies purus nunc accumsan scelerisque nibh elit. d dictumst pretium bibendum sem. Volutpat ultricies ultricies purus nunc accumsan scelerisque nibh elit. Pellentesque ultrices tincidunt donec lobortis sit blandit. Diam scelerisque sed sed diam ultricies nibh adipiscing dapibus. Platea ac vitae ac egestas eget praesent. Bibendum vitae turpis consectetur adipiscing faucibus bibendum cursus turpis. Sollicitudin tellus urna feugiat nunc sed orci elit sagittis gravida. Facilisis nibh ipsum mauris urna vestibulum molestie ac tellus. Dignissim mauris lacus nec vitae iaculis aliquam erat aliquam. "),
        ),
      ),
    );
  }
}
