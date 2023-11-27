import 'package:dartz/dartz.dart';
import 'package:ososs_flutter_task/core/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> call(In input);
}
