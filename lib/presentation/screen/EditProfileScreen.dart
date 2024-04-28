import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../CustomClass/AllColors.dart';
import '../../CustomClass/AllDimension.dart';
import '../../CustomClass/AllImages.dart';
import '../../CustomClass/AllString.dart';
import '../widget/GlobalWidgets.dart';
import '../widget/select_photo_options_screen.dart';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController controller = TextEditingController();
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.whiteColor,
        automaticallyImplyLeading: false,
        titleSpacing: AllDimension.zero,
        title: Row(children: [
          backButton(context),
          TabTitlesSide(AllString.txtProfileDtl)
        ]),
      ),
      body: Padding(
        padding: EdgeInsets.all(AllDimension.twelve),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(children: [
                  _image == null
                      ? CircleAvatar(
                          radius: AllDimension.fifty,
                          backgroundImage: AssetImage(AllImages.hoddies),
                        )
                      : CircleAvatar(
                          radius: AllDimension.fifty,
                          backgroundImage: FileImage(_image!),
                        ),
                  Positioned(
                      bottom: AllDimension.zero,
                      right: AllDimension.zero,
                      child: InkWell(
                        onTap: () => _showSelectPhotoOptions(context),
                        child: Container(
                          height: AllDimension.twentySix,
                          width: AllDimension.twentySix,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AllColors.accentColor),
                          child: Icon(
                            Icons.edit,
                            color: AllColors.whiteColor,
                            size: AllDimension.fourteen,
                          ),
                        ),
                      ))
                ]),
              ),
              SizedBox(
                height: AllDimension.thirty,
              ),
              labelTextFormField(
                label: AllString.hintName,
                maxLenght: 15,
                controller: controller,
                type: TextInputType.text,
                onValidate: (String? value) {},
              ),
              SizedBox(height: AllDimension.twenty),
              labelTextFormField(
                label: AllString.hintMobileNo,
                maxLenght: 10,
                controller: controller,
                type: TextInputType.number,
                onValidate: (String? value) {},
              ),
              SizedBox(height: AllDimension.twenty),
              labelTextFormField(
                label: AllString.hintNEmail,
                maxLenght: 15,
                controller: controller,
                type: TextInputType.emailAddress,
                onValidate: (String? value) {},
              ),
              SizedBox(height: AllDimension.twenty),
              labelTextFormField(
                label: AllString.hintGender,
                maxLenght: 10,
                controller: controller,
                type: TextInputType.text,
                onValidate: (String? value) {},
              ),
              SizedBox(height: AllDimension.twenty),
              labelTextFormField(
                label: AllString.hintCity,
                maxLenght: 13,
                controller: controller,
                type: TextInputType.text,
                onValidate: (String? value) {},
              ),
              SizedBox(height: AllDimension.twenty),
              defaultButton(context, AllString.txtUpdate, () {})
            ],
          ),
        ),
      ),
    );
  }

  Widget labelTextFormField(
      {required String label,
      required int maxLenght,
      required TextEditingController controller,
      required TextInputType type,
      required FormFieldValidator<String>? onValidate,
      ValueChanged<String>? onSubmit,
      ValueChanged<String>? onChanged,
      VoidCallback? onTap,
      String? suffix,
      int? maxLine}) {
    return TextFormField(
      keyboardType: type,
      maxLength: maxLenght,
      maxLines: maxLine,
      controller: controller,
      onFieldSubmitted: (s) {
        onSubmit;
      },
      onChanged: onChanged,
      onTap: onTap,
      validator: onValidate,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: AllColors.accentColor,
        ),
        counterText: '',
        hintText: '',
        hintStyle: TextStyle(
          color: Colors.transparent, // Make hint text transparent
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AllDimension.six),
          borderSide: BorderSide(
            color: AllColors.boderGreyColor,
            width: AllDimension.one,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AllDimension.six),
          borderSide: BorderSide(
            color: AllColors.accentColor,
            width: AllDimension.one,
          ),
        ),
        errorStyle: TextStyle(
          color: Colors.red, // Set the color for the error message text
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AllDimension.six),
          borderSide: BorderSide(
            color: Colors.red,
            width: AllDimension.one,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AllDimension.six),
          borderSide: BorderSide(
            color: Colors.red,
            width: AllDimension.one,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: AllDimension.fifteen, vertical: AllDimension.ten),
      ),
    );
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.24,
          maxChildSize: 0.26,
          minChildSize: 0.24,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }
}
