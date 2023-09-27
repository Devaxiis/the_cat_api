import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learn_pagination/core/service_locator.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
TextEditingController controller = TextEditingController();

final ImagePicker picker = ImagePicker();
File? image;
bool isLoading = false;

void cancelImage() async{
  setState(() => image = null);
}


void pickImage(ImageSource source) async {
  Navigator.pop(context);
  try {
  final result = await picker.pickImage(source: source);
  image = File(result!.path);
  setState(() {});  
  }on PlatformException {
       showMessage("Invalid image format");
  }catch (e) {
    showMessage("error");
  }
}
  void showMessage(String text){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }





void getImage(){
  showModalBottomSheet(
    context: context, 
  builder:(context) {
    return SafeArea(
      child: Column(
        children: [
          ListTile(title:  const Text( "Take a photo"),onTap: () => pickImage(ImageSource.camera),),
          ListTile(title: const Text("Phone gallery"), onTap: () => pickImage(ImageSource.gallery),),
        ],
      ),
    );
  });
}



void uploadImage () async{
  final description = controller.value.text.trim();
  if (image != null && description.isNotEmpty) {
    setState(() => isLoading = true);
    final path = image!.path;
    String? message = await repository.uploadImage(path, description);
    if (message != null) {
      showMessage(message);
      image = null;
      controller.clear();
      setState(()=> isLoading = false);
    }else{
      showMessage("Please selected Imaeg");
    }
  }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Image"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: uploadImage,
           icon: const Icon(Icons.cloud_upload_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Container
            Container(
              alignment: Alignment.center,
              height: MediaQuery.sizeOf(context).width,
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(20),
              color: Colors.white38,
              child:image != null? Stack(
                alignment: Alignment.topRight,
                children: [
                  Image(
                    image: FileImage(image!),
                    fit: BoxFit.cover,
                    ),
                   IconButton(
                    onPressed:cancelImage ,
                     icon: const Icon(Icons.cancel,size: 30,))
                ],
              ): ColoredBox(
                color: Colors.white38,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    GestureDetector(
                      onTap: getImage,
                      child: const Icon(
                        CupertinoIcons.paw,
                        size: 250,
                      ),
                    ),
                    Positioned(
                      bottom: MediaQuery.sizeOf(context).width / 3,
                      child: const Icon(Icons.add,color: Colors.white38,),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ///description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: "description",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder()
                ),
              ),
            ),
      
          
          ],
        ),
      ),
    );
  }
}
