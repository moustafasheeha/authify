abstract class BaseFailure {
  final String message;
  const BaseFailure(this.message);

  @override
  String toString() => message;
}
