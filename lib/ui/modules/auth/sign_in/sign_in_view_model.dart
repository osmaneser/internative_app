import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internative_app/core/services/dialog_service.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/models/request/req_sign_in.dart';
import 'package:internative_app/ui/models/response/res_sign_in.dart';
import 'package:internative_app/ui/modules/user/list/user_list_page.dart';
import 'package:internative_app/ui/repositories/login_repository.dart';
import 'package:internative_app/ui/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
part 'sign_in_view_model.g.dart';

class SignInViewModel = _SignInViewModelBase with _$SignInViewModel;

enum SignInState { Initial, Busy, Done, Error }

abstract class _SignInViewModelBase extends UserRepository with Store {
  LoginRepository repository = locator<LoginRepository>();

  @observable
  bool isObsecure = true;

  @observable
  late String message;

  @observable
  late TextEditingController ctrlEmail = TextEditingController();

  @observable
  late TextEditingController ctrlPassword = TextEditingController();

  @observable
  late GlobalKey<FormState> keyFormSignIn = GlobalKey<FormState>();

  @observable
  SignInState state = SignInState.Initial;

  @action
  Future<void> doSignIn(context) async {
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
        DialogService.durationDialog(context: context, message: result.message);
        state = SignInState.Error;
      } else {
        final token = ResSignIn.fromJson(result.data);
        await DialogService.durationDialog(
            context: context,
            message: "Giriş Başarılı",
            whenComplate: () async {
              
              await Navigator.push(context, MaterialPageRoute(builder: (context) => UserListPage()));
            });
        state = SignInState.Done;
      }
    } catch (e) {
      message = e.toString();
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
}
