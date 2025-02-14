import 'package:blogging_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository{
  Future<Either <Failures, String>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password
    });

    Future<Either <Failures, String>> loginWithEmailPassword({
    required String email,
    required String password
    });

}