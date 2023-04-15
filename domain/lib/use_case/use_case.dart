import 'package:domain/exceptions.dart';
import 'package:domain/logger.dart';

abstract class UseCase<P, R> {
  const UseCase({
    required this.logger,
    this.shouldLogError = true,
  });

  final ErrorLogger logger;
  final bool shouldLogError;

  Future<R> getRawFuture(P params);

  Future<R?> getFuture(P params) async {
    try {
      return await getRawFuture(params);
    } catch (error, stackTrace) {
      if (shouldLogError) {
        await logger('Use Case Error', error, stackTrace);
      }

      if (error is! StockItException) {
        throw UnexpectedException();
      } else {
        rethrow;
      }
    }
  }
}

class NoParams {}
