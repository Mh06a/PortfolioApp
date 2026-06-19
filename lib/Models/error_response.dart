class ErrorResponse {
  //step1 ----> here I will Create the class's variables :
  final String message;
  final int status;

  //step2 ----> here I will Create The constructor :
  ErrorResponse({required this.message, required this.status});

  //step3 ----> here I will Create Methode to transfer from Json :
  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(message: json['message'], status: json['status']);
  }
}
