import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ott_app/data/models/user_model.dart';
import 'package:ott_app/preference/shared_preferences.dart';
import 'package:ott_app/routes/app_router.gr.dart';
import 'package:ott_app/utils/constant.dart';

@RoutePage()
class ProfileAccountScreen extends StatefulWidget {
  const ProfileAccountScreen({super.key});

  @override
  State<ProfileAccountScreen> createState() => _ProfileAccountScreenState();
}


class _ProfileAccountScreenState extends State<ProfileAccountScreen> {
  UserResponse user = UserResponse();
  File? selectedImage;
  Uint8List? _image;

  @override
  void initState() {
    MyUserData();
    super.initState();
  }

  MyUserData() async {
    user.imgUrl = "assets/images/woman_female_avatar.png";
    String? email = await SharedPreferencesService.getSingleString(Constant.EMAIL);
    debugPrint(email);

    String? name = await SharedPreferencesService.getSingleString(Constant.NAME);
    String? password =
        await SharedPreferencesService.getSingleString(Constant.PASSWORD);
    String? gendar = await SharedPreferencesService.getSingleString(Constant.GENDAR);
    String? dob = await SharedPreferencesService.getSingleString(Constant.DOB);

    user.email = email;
    user.name = name;
    user.password = password;
    user.gendar = gendar;
    user.dob=dob;
    if (gendar == Constant.MALE) {
      user.imgUrl = "assets/images/man_avatar_male.png";
    }
    setState(() { });
  }

  void getData(String updatedEmail)  {
    setState(() async {
      String? email = await SharedPreferencesService.getSingleString(Constant.EMAIL);

      user.email = email;
    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              centerTitle: false,
              backgroundColor: Colors.blue,

              title: Text("Profile Screen"),
            ),
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Row(

                            children: [
                              _image!=null ?
                              CircleAvatar(
                                radius: 50, // Image radius
                                backgroundImage: MemoryImage(_image!)

                              )
                              : CircleAvatar(
                                            radius: 50, // Image radius
                                            backgroundImage: AssetImage(user.imgUrl.toString())
                              ),

                              const SizedBox(width: 20),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:
                                  [
                                    Text(user.name.toString(),
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          fontSize: 15.00,
                                          fontWeight: FontWeight.bold)),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        var updatedName =
                                        await context.pushRoute(UpdateNameRoute());
                                        MyUserData();
                                        // getData(updatedEmail.toString());
                                      },
                                      // Image tapped
                                      child: Image.asset(
                                        'assets/images/pen.png',
                                        fit: BoxFit.cover,
                                        // Fixes border issues
                                        width: 30.0,
                                        height: 30.0,
                                      ),
                                    )
                                  ]
                                ),
                                Row(
                                  children: [
                                    Text(user.email.toString(),
                                        style: const TextStyle(
                                            color: Colors.blue,
                                            fontSize: 15.00,
                                            fontWeight: FontWeight.bold)),

                                  ],
                                )
                              ]),
                            ],
                          ),
                          Positioned(
                              bottom: 10,
                              left: 70,
                              child: IconButton(
                                onPressed: (){
                                  showImagePickerOption(context);
                                },icon:  const Icon(Icons.add_a_photo),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(user.dob.toString(),
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 20.00,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start),
                          const SizedBox(
                            width: 50,
                          ),
                          GestureDetector(
                            onTap: () async {
                              var updatedEmail =
                                 await context.pushRoute(UpdateDobRoute());
                              MyUserData();
                              // getData(updatedEmail.toString());
                            },
                            // Image tapped
                            child: Image.asset(
                              'assets/images/pen.png',
                              fit: BoxFit.cover,
                              // Fixes border issues
                              width: 30.0,
                              height: 30.0,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      Text(user.gendar.toString(),
                          style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 20.00,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                      const Text("",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20.00,
                              fontWeight: FontWeight.bold)),
                    ]),
              ),
            )));
  }

  void showImagePickerOption(BuildContext context)
  {
    showModalBottomSheet(
        backgroundColor: Colors.blue[100],
        context: context, builder: (builder)
    {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height/4.5,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    _pickImageFromGallery();
                  },
                  child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.image,size: 70,),Text("Gallery")
                        ],
                      )),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: (){
                    _pickImageFromCamera();
                  },
                  child: const SizedBox(
                      child: Column(
                        children: [
                          Icon(Icons.camera_alt,size: 70,),Text("Camera")
                        ],
                      )),
                ),
              )
            ],
          ),
        ),
      );

    });
  }

  Future _pickImageFromGallery () async{
    final returnImage=
        await ImagePicker().pickImage(source:ImageSource.gallery);
    if(returnImage==null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image =File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();

  }
  Future _pickImageFromCamera() async {
    final returnImage =
    await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
