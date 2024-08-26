import 'package:blocstatemanagement/cubit/user_cubit_state.dart';
import 'package:blocstatemanagement/model/user_model.dart';
import 'package:blocstatemanagement/network/rest_api_client.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserCubitState>{
  List<UserModel> userList = [];
  RestApiClient restApiClient;
  UserCubit({required this.restApiClient}) : super(UserCubitInit());

  void getUserList()async{
    try{
      emit(UserCubitLoading());
      userList = await restApiClient.getData();
      emit(UserCubitDataLoaded(userList: userList));
    }catch(e){
      emit(UserCubitError(message: e.toString()));
    }
  }
}