part of 'pic_products_cubit.dart';

@immutable
sealed class PicProductsState {}

final class PicProductsInitial extends PicProductsState {}

class ImagePickedState extends PicProductsState {}

class ImagePickErrorState extends PicProductsState {}

class ImageUploadSuccessState extends PicProductsState {}

class ImageUploadErrorState extends PicProductsState {}
