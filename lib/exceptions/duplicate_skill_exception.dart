import 'package:protfolio_app/exceptions/api_exception.dart';

class DuplicateSkillException extends ApiException {
  //step1 ----> call ApiExceotion class :
  DuplicateSkillException(super.message);
}
