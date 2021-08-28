import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:internative_app/core/mixins/validation_input.dart';
import 'package:internative_app/core/reusuable_widgets/button/oe_button.dart';
import 'package:internative_app/core/reusuable_widgets/text_form_field/oe_text_form_field.dart';
import 'package:internative_app/init/locator.dart';
import 'package:internative_app/ui/modules/auth/sign_in/sign_in_view_model.dart';

class SignInPage extends StatelessWidget with OeValidation {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vModelSignIn = locator<SignInViewModel>();
    vModelSignIn.initializeAuth();
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Observer(
            builder: (_) {
              return Form(
                key: vModelSignIn.keyFormSignIn,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                      onTap: () {
                        vModelSignIn.doSignIn(context);
                      },
                      text: "Giriş Yap",
                    )
                  ],
                ),
              );
            },
          )),
    );
  }
}
