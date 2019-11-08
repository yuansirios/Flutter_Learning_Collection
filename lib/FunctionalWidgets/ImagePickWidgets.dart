import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../Components/YSTools.dart';
import '../Components/Dialog/YSBottomSheet.dart';

class ImagePickWidgets extends StatefulWidget {
  @override
  _ImagePickWidgetsState createState() => _ImagePickWidgetsState();
}

class _ImagePickWidgetsState extends State<ImagePickWidgets> {
  File _imageFile;

  _imagePickEvent() {
    YSBottomSheet.showSheet(["拍照", "相册"], (int index) {
      if (index == 1) {
        getImageForGallery(false);
      }
      if (index == 2) {
        getImageForGallery(true);
      }
    });
  }

  Future getImageForGallery(bool gallery) async {
    File image = await ImagePicker.pickImage(source: gallery?ImageSource.gallery:ImageSource.camera);
    setState(() {
      _imageFile = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    YSBottomSheet.init(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('拍照和相册详解'),
        ),
        body: Center(
          child: UnconstrainedBox(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text("获取照片"),
                  onPressed: _imagePickEvent,
                ),
                Container(
                    width: 300,
                    height: 300,
                    child: YSTools.borderContainer(_imageFile != null
                        ? Image.file(
                            _imageFile,
                            fit: BoxFit.contain,
                          )
                        : null))
              ],
            ),
          ),
        ));
  }
}
