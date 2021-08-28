import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:internative_app/core/configs/path_config.dart';
import 'package:internative_app/core/enums/aler_type_enum.dart';
import 'package:internative_app/core/mixins/validation_input.dart';
import 'package:internative_app/core/reusuable_widgets/button/oe_button.dart';
import 'package:internative_app/core/reusuable_widgets/text/oe_content_text.dart';
import 'package:internative_app/core/reusuable_widgets/text_form_field/oe_text_form_field.dart';
import 'package:internative_app/core/services/dialog_service.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/auth/sign_in/sign_in_view_model.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with OeValidation {
  @override
  void dispose() {
    final vModelSignIn = locator<SignInViewModel>();
    vModelSignIn.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final vModelSignIn = locator<SignInViewModel>();
    if (vModelSignIn.state == SignInState.Initial) vModelSignIn.initializeAuth();

    final _errorLoginInfo = Card(
      child: Observer(
        builder: (_) => Column(
          children: vModelSignIn.validationErrors
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.cancel,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      OeContentText(text: e.value),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer(
          builder: (_) {
            return Form(
              key: vModelSignIn.keyFormSignIn,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Expanded(flex: 40, child: Image.asset("${PathConfig.pngPath}logo.png")),
                    Expanded(
                      flex: 60,
                      child: Column(
                        children: [
                          OeTextFormField(
                            validator: (val) => validateEmail(val),
                            controller: vModelSignIn.ctrlEmail,
                            labelText: "Kullanıcı Adı",
                          ),
                          OeTextFormField(
                            labelText: "Şifre",
                            controller: vModelSignIn.ctrlPassword,
                            keyboardType: TextInputType.number,
                            validator: (value) => validatePassword(value),
                            isObsecure: vModelSignIn.isObsecure,
                            suffixIcon: InkWell(
                              onTap: () => vModelSignIn.changeObsecureState(),
                              child: Icon(vModelSignIn.isObsecure ? Icons.visibility_off : Icons.visibility),
                            ),
                          ),
                          OeButton(
                            isLoading: vModelSignIn.state == SignInState.Busy,
                            onTap: () async {
                              await vModelSignIn.doSignIn(context);
                              if (vModelSignIn.state == SignInState.Error && vModelSignIn.validationErrors.length > 0) {
                                DialogService.alertDialog(
                                  context: context,
                                  content: _errorLoginInfo,
                                  alertType: AlertType.Error,
                                  showCancelBtn: false,
                                  confirmText: "Kapat",
                                  onConfirm: () {
                                    Navigator.pop(context);
                                  },
                                );
                              }
                            },
                            text: "Giriş Yap",
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
