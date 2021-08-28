import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:internative_app/core/enums/aler_type_enum.dart';
import 'package:internative_app/core/models/validation_error.dart';
import 'package:internative_app/core/services/dialog_service.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/models/request/req_sign_in.dart';
import 'package:internative_app/ui/models/response/res_sign_in.dart';
import 'package:internative_app/ui/modules/home/home_page.dart';
import 'package:internative_app/ui/repositories/login_repository.dart';
import 'package:internative_app/ui/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'sign_in_view_model.g.dart';

class SignInViewModel = _SignInViewModelBase with _$SignInViewModel;

enum SignInState { Initial, Busy, Done, Error }

abstract class _SignInViewModelBase extends UserRepository with Store {
  LoginRepository repository = locator<LoginRepository>();

  @observable
  Box? boxAuth;

  @observable
  bool isObsecure = true;

  @observable
  String? message;

  @observable
  List<ValidationError> validationErrors = [];

  @observable
  late TextEditingController ctrlEmail = TextEditingController();

  @observable
  late TextEditingController ctrlPassword = TextEditingController();

  @observable
  GlobalKey<FormState> keyFormSignIn = GlobalKey<FormState>();

  @observable
  SignInState state = SignInState.Initial;

  @action
  Future<void> initializeAuth() async {
    boxAuth = await Hive.openBox('authBox');
    await boxAuth!.put('token', "");
  }

  @action
  Future<void> doSignIn(context) async {
    validationErrors = [];
    try {
      state = SignInState.Busy;
      await Future.delayed(Duration(milliseconds: 250));
      if (!isValidForm()) {
        state = SignInState.Error;
        message = "Hatalı Form";
        return;
      }

      final result = await repository.signIn(ReqSignIn(email: ctrlEmail.text, password: ctrlPassword.text));
      if (result.hasError) {
        if (result.validationErrors.length == 0)
          DialogService.durationDialog(context: context, message: result.message, alertType: AlertType.Error);
        validationErrors = result.validationErrors;
        state = SignInState.Error;
      } else {
        final response = ResSignIn.fromJson(result.data);
        await DialogService.durationDialog(
            context: context,
            message: "Giriş Başarılı",
            alertType: AlertType.Success,
            whenComplate: () async {
              boxAuth!.put("token", response.token);
              await Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
            });
        state = SignInState.Done;
      }
    } catch (e) {
      DialogService.durationDialog(context: context, message: e.toString(), alertType: AlertType.Error);
      state = SignInState.Error;
    }
  }

  @action
  bool isValidForm() {
    return keyFormSignIn.currentState!.validate();
  }

  @action
  void changeObsecureState() {
    isObsecure = !isObsecure;
  }

  @action
  void dispose() {
    ctrlEmail = TextEditingController();
    ctrlPassword = TextEditingController();
    keyFormSignIn = GlobalKey<FormState>();
    state = SignInState.Initial;
  }
}
