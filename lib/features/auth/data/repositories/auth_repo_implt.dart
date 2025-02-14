import 'package:blogging_app/core/error/exception.dart';
import 'package:blogging_app/core/error/failures.dart';
import 'package:blogging_app/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:blogging_app/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImplt implements AuthRepository{
  final AuthRemoteDataSources remoteDataSources;
  const AuthRepoImplt(this.remoteDataSources);
  @override
  Future<Either<Failures, String>> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> signUpWithEmailPassword({
    required String name, 
    required String email, 
    required String password}) 
  async{
    try {
     final userId = await remoteDataSources.signUpWithEmailPassword(name: name, email: email, password: password);
     return right(userId); //right here means success
    } on ServerException catch (e) {
      return left(Failures(e.message));
      
    }
  }

}