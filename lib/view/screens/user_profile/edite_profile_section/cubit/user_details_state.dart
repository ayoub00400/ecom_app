part of 'user_details_cubit.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class UserDetaailsUploading extends UserDetailsState {}

class UserDetaailsUploadingDone extends UserDetailsState {}

class UserDetaailsUploadingFailed extends UserDetailsState {}
