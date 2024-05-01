import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final picker = ImagePicker();
  String? name, description;
  XFile? image;
  File? imagePath;

  ProfileBloc() : super(ProfileInitial()) {
    on<OnChangeImage>((event, emit) async {
      await picker.pickImage(source: ImageSource.gallery).then((value) {
        image = value;
      });
      if (image == null) {
        emit(ProfileUser(
            image: imagePath, name: name, description: description));
      }
      imagePath = File(image!.path);
      emit(ProfileUser(image: imagePath, name: name, description: description));
    });

    on<OnChangeName>((event, emit) {
      name = event.name;
      emit(ProfileUser(image: imagePath, name: name, description: description));
    });

    on<OnChangeDescriptions>((event, emit) {
      description = event.description;
      emit(ProfileUser(image: imagePath, name: name, description: description));
    });
  }
}
