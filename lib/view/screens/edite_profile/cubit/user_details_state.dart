part of 'user_details_cubit.dart';

@immutable
abstract class UserDetailsState {}

class UserDetailsInitial extends UserDetailsState {}

class UserDetailsUploading extends UserDetailsState {}

class UserDetailsUploadingDone extends UserDetailsState {}

class UserDetailsUploadingFailed extends UserDetailsState {}
