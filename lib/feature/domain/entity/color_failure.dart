
import 'package:clean_arch/core/use_case/failure/failure.dart';

class ColorFailure extends Failure{
  ColorFailure({required super.code, super.message = ''});
  
  @override
  String getLocallizedString() {
    return 'Fail';
  }
  
}