class ErrorModel {
  final String? message;
  final String?
      code; // Optional code for categorizing errors (e.g., Firebase error codes)
  final Map<String, dynamic>?
      errors; // Optional flag to indicate critical errors

  ErrorModel({
    this.message,
    this.code,
    this.errors,
  });

  // String getAllErrorsMesseges() {
  //   if (errors.isNullOrEmpty()) return message ?? "Unkwon Error Occurred";

  //   final errorMessage = errors!.entries.map((entry) {
  //     final value = entry.value;
  //     return "${value.join(',')}";
  //   }).join('\n');
  //   return errorMessage;
  // }
}
