import 'package:blocstatemanagement/model/user_model.dart';
import 'package:equatable/equatable.dart';

abstract class UserCubitState extends Equatable{
  const UserCubitState();
}

class UserCubitInit extends UserCubitState{
  @override
  List<Object?> get props => [];
}

class UserCubitLoading extends UserCubitState{
  @override
  List<Object?> get props => [];
}

class UserCubitDataLoaded extends UserCubitState{

  UserCubitDataLoaded({required this.userList});
  List<UserModel> userList ;

  @override
  List<Object?> get props => [userList];
}

class UserCubitError extends UserCubitState{

  UserCubitError({required this.message});
  String message;

  @override
  List<Object?> get props => [message];
}