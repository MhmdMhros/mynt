import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../../app/functions.dart';
import '../../resources/strings_manager.dart';

class Email extends FormzInput<String, EmailValidationError>
    with EquatableMixin {
  const Email.unvalidated([
    String value = '',
  ])  : isAlreadyRegistered = false,
        super.pure(value);

  const Email.validated(
    String value, {
    this.isAlreadyRegistered = false,
  }) : super.dirty(value);

  final bool isAlreadyRegistered;

  @override
  EmailValidationError? validator(String value) {
    if (value.isEmpty) {
      return EmailValidationError.empty;
    } else {
      if (isAlreadyRegistered) {
        return EmailValidationError.alreadyRegistered;
      }
      if (!isEmail(value)) {
        return EmailValidationError.invalid;
      }
    }
    return null;
  }

  @override
  List<Object?> get props => [
        value,
        isPure,
        isAlreadyRegistered,
      ];
}

enum EmailValidationError {
  empty(AppStrings.fillField),
  invalid(AppStrings.invalidEmail),
  alreadyRegistered("This email is already registered.");

  const EmailValidationError(this.value);
  final String value;
}
