import 'package:protfolio_app/core/exceptions/api_exception.dart';

class NotFoundException extends ApiException {
  //step1 ----> call ApiExceotion class :
  NotFoundException(super.message);
}
