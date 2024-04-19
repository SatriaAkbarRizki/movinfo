part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileImage extends ProfileState 
{
  File? image;
  ProfileImage(this.image);
}

final class ProfileName extends ProfileState {
  final String? name;
  ProfileName(this.name);
}

final class ProfileDescription extends ProfileState {
  final String? description;
  ProfileDescription(this.description);
}
