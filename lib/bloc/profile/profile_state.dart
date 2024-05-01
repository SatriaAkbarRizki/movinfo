part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileUser extends ProfileState {
  final File? image;
  final String? name;
  final String? description;

  ProfileUser(
      {required this.image, required this.name, required this.description});
}


