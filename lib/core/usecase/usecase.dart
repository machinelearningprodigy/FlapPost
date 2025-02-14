import 'package:blogging_app/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either <Failures, SuccessType>> call(Params params);
}