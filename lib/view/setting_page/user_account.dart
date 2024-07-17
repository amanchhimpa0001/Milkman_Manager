import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:milkman_manager_app/componants/custum_elevated_btn.dart';
import 'package:milkman_manager_app/controllers/all_controllers.dart';
import 'package:milkman_manager_app/controllers/app_state.dart';
import 'package:milkman_manager_app/controllers/authcontrollers.dart';
import 'package:milkman_manager_app/helpers/all_image.dart';
import 'package:milkman_manager_app/helpers/app_services.dart';
import 'package:milkman_manager_app/helpers/color_sheet.dart';
import 'package:milkman_manager_app/helpers/text_theme.dart';
import 'package:provider/provider.dart';

class User_Account extends StatefulWidget {
  const User_Account({super.key});

  @override
  State<User_Account> createState() => _User_AccountState();
}

class _User_AccountState extends State<User_Account> {
  String image = "";
  String newimageurl = "";
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AuthController>(context);
    var loading = Provider.of<App_state_controllers>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "User Account",
            style: GetTextTheme.fs20_regular,
          ),
        ),
        body: Column(children: [
          Appservices.addheight(40),
          Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                imageFile != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.file(
                          imageFile!,
                          fit: BoxFit.cover,
                          width: 150,
                          height: 150,
                        ))
                    : provider.getuser_data.image!.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.network(
                              provider.getuser_data.image!,
                              fit: BoxFit.cover,
                              width: 150,
                              height: 150,
                            ))
                        : Container(
                            height: 150,
                            width: 150,
                            child: Image.asset(
                              Getimage.profileimg,
                              fit: BoxFit.cover,
                            ),
                          ),
                // imageFile == null
                //     ? (image.isEmpty
                //         ? Container(
                //             height: 150,
                //             width: 150,
                //             child: Image.asset(
                //               Getimage.profileimg,
                //               fit: BoxFit.cover,
                //             ),
                //           )
                //         : Image.network(
                //             image,
                //             fit: BoxFit.cover,
                //           ))
                //     : ClipRRect(
                //         borderRadius: BorderRadius.circular(1000),
                //         child: Image.file(
                //           imageFile!,
                //           height: 150,
                //           width: 150,
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                Positioned(
                    right: 15,
                    child: GestureDetector(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (context) =>
                              imagePickerbottomSheet(context)),
                      child: Container(
                        padding: EdgeInsets.all(5.sp),
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: AppColors.darkgrey, width: 2),
                          color: AppColors.grey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                        ),
                      ),
                    )),
              ],
            ),
          ),
          Appservices.addheight(40),
          CustomElevatedButton(
            btnName: "Save Account",
            loading: loading.get_loader,
            onTap: () async {
              print(provider.getuser_data.image!);
              newimageurl = await AllFuntion(provider, context)
                  .uploadFile(imageFile!, provider.getuser_data.image!);
              await AllFuntion(provider, context)
                  .getupdateuserdata(provider.getuser_data.uid!, newimageurl);

              // if (imageFile == null) {
              //   if (image.isEmpty) {
              //     await AllFuntion(provider, context).uploadimg(imageFile!);
              //   }  {
              //     await AllFuntion(provider, context).updateimg(
              //       image,
              //       imageFile!,
              //     );
              //   }
              //   provider.updateProfileImage(image);
              //   await provider.getuser_data.copyWith(image: image);
              // } else {
              //   Utils.toastmassage("image not found");
              // }
            },
            foreground_clr: AppColors.whiteColor,
          )
        ]));
  }

  getImageFormGallery(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.gallery);

    if (getImage != null) {
      setState(() {
        imageFile = File(getImage.path);
      });
      Navigator.of(context).pop();
    }
  }

  getImageFormCamra(BuildContext context) async {
    // ignore: invalid_use_of_visible_for_testing_member
    var getImage = await ImagePicker.platform
        .getImageFromSource(source: ImageSource.camera);

    if (getImage != null) {
      setState(() {
        imageFile = File(getImage.path);
      });
      Navigator.of(context).pop();
    }
  }

  imagePickerbottomSheet(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: Container(
        color: Colors.white,
        height: 250,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Pic Image From",
                style: GetTextTheme.fs20_bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  getImageFormCamra(context);
                },
                icon: const Icon(Icons.camera),
                label: const Text("CAMERA"),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  getImageFormGallery(context);
                },
                icon: const Icon(Icons.image),
                label: const Text("GALLERY"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Appservices.goback(context);
                },
                icon: Icon(Icons.close),
                label: Text("CANCEL"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
