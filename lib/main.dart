import 'package:blocstatemanagement/bloc/counter/counter_bloc.dart';
import 'package:blocstatemanagement/bloc/switch/switch_bloc.dart';
import 'package:blocstatemanagement/cubit/counter_cubit.dart';
import 'package:blocstatemanagement/cubit/counter_cubit_state.dart';
import 'package:blocstatemanagement/cubit/user_cubit.dart';
import 'package:blocstatemanagement/cubit/user_cubit_state.dart';
import 'package:blocstatemanagement/model/user_model.dart';
import 'package:blocstatemanagement/network/rest_api_client.dart';
import 'package:blocstatemanagement/view/counter_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> CounterBloc()),
        BlocProvider(create: (context)=> CounterCubit()),
        BlocProvider(create: (context)=> UserCubit(restApiClient: RestApiClient())),
        BlocProvider(create: (context)=> SwitchBloc())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: CounterScreen(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: BlocBuilder<CounterCubit,CounterCubitState>(
        builder: (context,state)=>Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              state is CounterValueUpdate ? Text(state.counter.toString()) : Text('0'),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                      onPressed: (){
                    context.read<CounterCubit>().counterIncrease();
                  },child: Icon(Icons.add)),
                  FloatingActionButton(onPressed: (){
                    context.read<CounterCubit>().counterDecrease();
                  },child: Icon(Icons.remove))
                ],
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UserListScreen()));
              }, child: Text('UserList'))
            ],
          ),
        ),
      )
    ));
  }
}

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUserList();
    return SafeArea(child: Scaffold(
      body: BlocBuilder<UserCubit,UserCubitState>(
        builder: (context,state){
          if(state is UserCubitLoading){
            return CircularProgressIndicator();
          }else if(state is UserCubitError){
            return Text(state.message.toString());
          }else if(state is UserCubitDataLoaded){
            return ListView.builder(
              itemCount: state.userList.length,
                itemBuilder: (context,index){
                UserModel item = state.userList[index];
              return ListTile(
                title: Text(item.name.toString()),
                leading: Text(item.id.toString()),
                subtitle: Text(item.email.toString()),
              );
            });
          }else{
            return SizedBox();
          }
        },
      ),
    ));
  }
}
