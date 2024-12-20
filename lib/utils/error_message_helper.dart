class ErrorMessageHelper {
  static String parseError(Object error) {
    final errorString = error.toString();
    if (error is Exception) return errorString.replaceFirst('Exception:', '').trim();

    return errorString;
  }
}
