import 'dart:io';

import 'package:challenge_diabetes/core/networking/api_serveices_pic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'pic_products_state.dart';

class PicProductsCubit extends Cubit<PicProductsState> {
  PicProductsCubit() : super(PicProductsInitial());
  static PicProductsCubit get(context) => BlocProvider.of(context);
  File? selectedImage;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      emit(ImagePickedState());
    } else {
      debugPrint('No image selected.');
      emit(ImagePickErrorState());
    }
  }

  Future<void> uploadImage() async {
    if (selectedImage == null) return;

    String uploadUrl =
        'http://nouraapi.runasp.net/api/upload'; 

    try {
      var response = await ApiServeicesPic().uploadImage(
        url: uploadUrl,
        image: selectedImage!,
      );

      if (response.statusCode == 200) {
        debugPrint('Image uploaded successfully');
        emit(ImageUploadSuccessState());
      } else {
        debugPrint('Image upload failed');
        emit(ImageUploadErrorState());
      }
    } catch (e) {
      debugPrint('Error: $e');
      emit(ImageUploadErrorState());
    }
  }
}
