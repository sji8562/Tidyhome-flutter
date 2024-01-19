import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'dart:io';

import 'package:toyproject/_core/constants/color.dart';

class UserPic extends StatefulWidget {
  final Function(String?) onImageSelected;

  const UserPic({Key? key, required this.onImageSelected}) : super(key: key);

  @override
  State<UserPic> createState() => _UserPicState();
}


class _UserPicState extends State<UserPic> {
  XFile? _image; //이미지를 담을 변수 선언
  final ImagePicker picker = ImagePicker(); //ImagePicker 초기화

  //이미지를 가져오는 함수
  Future getImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: imageSource);

    if (pickedFile != null) {
      Uint8List temp = await pickedFile.readAsBytes();
      String completeEncoded = base64Encode(temp);

      setState(() {
        _image = XFile(pickedFile.path);
        widget.onImageSelected(completeEncoded);
      });
      Logger().d(completeEncoded);
    }
  }

  Future getCameraImage(ImageSource imageSource) async {
    //pickedFile에 ImagePicker로 가져온 이미지가 담긴다.
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      Uint8List temp = await pickedFile.readAsBytes();
      String completeEncoded = base64Encode(temp);

      setState(() {
        _image = XFile(pickedFile.path);
        widget.onImageSelected(completeEncoded);
      });
      Logger().d(completeEncoded);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30, width: double.infinity),
            _buildPhotoArea(),
            SizedBox(height: 20),
          ]
      ),
    );
  }

  Widget _buildPhotoArea() {
    return Container(
        width: 220,
        height: 270,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // 테두리 둥근 정도 결정
            // TODO 언약: 이미지 매겨변수 받기
            child: InkWell(
              onTap: (){
                showDialog(
                  context: context,
                  barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
                  builder: ((context) {
                    Logger().d("여기 뜹니까");
                    return Padding(
                      padding: const EdgeInsets.only(top: 300),
                      child: AlertDialog(
                        title: Center(child: Text("이미지 등록 및 촬영")),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(5),
                                  boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 0.5, blurRadius: 5)],
                                ),
                                child: IconButton(
                                    onPressed: (){
                                      getImage(ImageSource.gallery);
                                    },
                                    icon: Icon(
                                      Icons.add_photo_alternate_outlined,
                                      size: 30,
                                      color: Colors.white,
                                    )
                                )
                            ),
                            //카메라로 촬영하기
                            Container(
                                margin: EdgeInsets.all(10),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(color: Colors.grey.withOpacity(0.5), spreadRadius: 0.5, blurRadius: 5)
                                  ],
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      getCameraImage(ImageSource.camera);
                                    },
                                    icon: Icon(Icons.add_a_photo, size: 30, color: Colors.white,)
                                )
                            ),
                          ],
                        ),
                        actions: <Widget>[
                          Container(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(); //창 닫기
                              },
                              child: Text("닫기"),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                );
              },
              child: _image == null ? Image.asset("assets/images/basicpic.jpg",fit: BoxFit.cover)
                      : Image.file(
                File(_image!.path),
                width: double.infinity, // 부모의 가로 크기에 맞추기
                height: double.infinity, // 부모의 세로 크기에 맞추기
                fit: BoxFit.cover, // 이미지를 가득 채우도록 설정
              ),
            )
        )
      // Image.asset(imageUrl)))

    );
  }
}
