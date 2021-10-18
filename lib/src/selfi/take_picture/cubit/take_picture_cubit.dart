import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:package_ejemplo/src/domains/selfi/repositories/selfi-repository.dart';

part 'take_picture_state.dart';

class TakePictureCubit extends Cubit<TakePictureState> {
  SelfiRepository selfiRepository;

  TakePictureCubit() : super(TakePictureInitial());

  File? image;
  seleccionarFoto() async {
    await _procesarFoto(ImageSource.camera);
  }

  Future<void> _procesarFoto(ImageSource origen) async {
    final pickedFile =
        await ImagePicker().pickImage(source: origen, imageQuality: 80);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(TakePictureWithImage(image!));
    } else {
      emit(TakePictureFail());
    }
  }

  void gotoSuccess() {
    emit(TakePictureGoTo());
  }

  Future<void> _procesarFoto2(ImageSource origen) async {
    try {
      final pickedFile = await selfiRepository.validate();
      emit(TakePictureWithImage(image!));
    } catch (e) {
      emit(TakePictureFail(e));
    }
  }
}
