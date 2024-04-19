part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class OnChangeImage extends ProfileEvent {}

class OnChangeName extends ProfileEvent {
  final String name;
  OnChangeName({required this.name});
}

class OnChangeDescriptions extends ProfileEvent {
  final String description;
  OnChangeDescriptions({required this.description});
}
