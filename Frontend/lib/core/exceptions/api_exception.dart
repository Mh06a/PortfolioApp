class ApiException implements Exception {
  //step1 ----> here I will Create vars :
  final String message;

  //step2 ----> here I will Create a Con :
  ApiException(this.message);

  //step3 ----> here I will call toString function :
  @override
  String toString() {
    return message;
  }
}
