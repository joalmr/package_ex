import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:package_ejemplo/src/components/button_primary.dart';
import 'package:package_ejemplo/src/components/button_secondary.dart';
import 'package:package_ejemplo/src/style/styles.dart';

class TakePicturePkg extends StatefulWidget {
  const TakePicturePkg({Key? key}) : super(key: key);

  @override
  State<TakePicturePkg> createState() => _TakePicturePkgState();
}

class _TakePicturePkgState extends State<TakePicturePkg> {
  seleccionarLogo() async {
    await _procesarLogo(ImageSource.camera);
  }

  File? _image;

  Future<void> _procesarLogo(ImageSource origen) async {
    final pickedFile =
        await ImagePicker().pickImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    } else {
      print('No image');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Resultado de la foto',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: bluePacifico,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: seleccionarLogo,
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image(
                          image: FileImage(_image!),
                          fit: BoxFit.cover,
                          height: 160,
                          width: 160,
                        ),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey[400],
                        radius: 80,
                      ),
              ),
              SizedBox(height: 10),
              buttonPrimary(
                onPressed: () {},
                text: 'Continuar',
                minimumSize: Size(MediaQuery.of(context).size.width * 0.60, 35),
              ),
              SizedBox(height: 10),
              buttonSecondary(
                onPressed: () {},
                text: 'Volver a tomar la foto',
                minimumSize: Size(MediaQuery.of(context).size.width * 0.60, 35),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
