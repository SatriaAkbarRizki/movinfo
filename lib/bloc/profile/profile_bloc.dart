import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final picker = ImagePicker();
  XFile? image;
  ProfileBloc() : super(ProfileInitial()) {
    //  fixing onChange not listing
    on<OnChangeImage>((event, emit) async {
      await picker.pickImage(source: ImageSource.gallery).then((value) {
        image = value;
      });
      if (image == null) {
        emit(ProfileImage(null));
      }
      final imagePath = File(image!.path);
      log(imagePath.path.toString() ?? 'failed get image');
      emit(ProfileImage(imagePath));
    });

    on<OnChangeName>((event, emit) {
      log('Name: ${event.name.toString()}');
      emit(ProfileName(event.name ?? null));
    });

    on<OnChangeDescriptions>((event, emit) {
      log('Description: ${event.description}');
      emit(ProfileDescription(event.description ?? null));
    });
  }
}
