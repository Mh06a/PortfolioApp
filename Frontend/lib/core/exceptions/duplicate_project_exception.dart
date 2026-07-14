import 'package:protfolio_app/core/exceptions/api_exception.dart';

class DuplicateProjectException extends ApiException {
  //step1 ----> call ApiExceotion class :
  DuplicateProjectException(super.message);
}
