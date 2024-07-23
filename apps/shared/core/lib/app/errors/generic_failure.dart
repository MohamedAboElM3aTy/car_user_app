abstract class Failure {}

/// Can be used when the list of exceptions is exhausted. Also, It maps to [GenericApplicationException].
class GenericFailure extends Failure {
  GenericFailure({
    required this.message,
    this.isAction = false,
  });

  final String message;
  final bool isAction;
}
