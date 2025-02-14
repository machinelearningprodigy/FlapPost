import 'package:blogging_app/core/error/failures.dart';
import 'package:blogging_app/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepoImplt implements AuthRepository{
  @override
  Future<Either<Failures, String>> loginWithEmailPassword({required String email, required String password}) {
    // TODO: implement loginWithEmailPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, String>> signUpWithEmailPassword({required String name, required String email, required String password}) {
    // TODO: implement signUpWithEmailPassword
    throw UnimplementedError();
  }

}