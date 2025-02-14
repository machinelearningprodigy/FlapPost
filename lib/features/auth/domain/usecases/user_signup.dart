import 'package:blogging_app/core/error/failures.dart';
import 'package:blogging_app/core/usecase/usecase.dart';
import 'package:blogging_app/features/auth/domain/repository/auth_repo.dart';
import 'package:fpdart/fpdart.dart';

class UserSignup implements UseCase<String, UserSignUpParameter> {
  final AuthRepository authRepository;
  const UserSignup(this.authRepository);

  @override
  Future<Either<Failures, String>> call(UserSignUpParameter params) async {
    return await authRepository.signUpWithEmailPassword(
     name: params.name,
     email: params.email, 
     password: params.password);
  }
}

class UserSignUpParameter{
final String name;
final String email;
final String password;

  UserSignUpParameter({
    required this.name, 
    required this.email, 
    required this.password});

}