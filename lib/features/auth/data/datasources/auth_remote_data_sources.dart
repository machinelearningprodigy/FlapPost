import 'package:blogging_app/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSources {
  Future<String> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}


class ImplementAuthRemoteDataSource implements AuthRemoteDataSources{
  final SupabaseClient supabaseClient;
  ImplementAuthRemoteDataSource(this.supabaseClient);
  @override
  Future<String> loginWithEmailPassword({
    required String email, 
    required String password,}) 

    {
    throw UnimplementedError();
    }

  @override
  Future<String> signUpWithEmailPassword({
    required String name, 
    required String email, 
    required String password,}) 

    async {
      try{
       final resposne = await supabaseClient.auth.signUp(
          password: password, 
          email: email,
          data : {
            'name' : name,
          }
          );
          if(resposne.user == null){
            throw const ServerException('User is null!');
          }
          return resposne.user!.id;
      }catch (e){
        throw ServerException(e.toString());
      }
    }
}