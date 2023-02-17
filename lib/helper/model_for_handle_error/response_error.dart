class ResponseError {
  bool status;
  int statusCode;
  String message;

  ResponseError({
    required this.status,
    required this.statusCode,
    required this.message,
  });
}
