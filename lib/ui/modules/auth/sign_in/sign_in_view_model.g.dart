// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignInViewModel on _SignInViewModelBase, Store {
  final _$isObsecureAtom = Atom(name: '_SignInViewModelBase.isObsecure');

  @override
  bool get isObsecure {
    _$isObsecureAtom.reportRead();
    return super.isObsecure;
  }

  @override
  set isObsecure(bool value) {
    _$isObsecureAtom.reportWrite(value, super.isObsecure, () {
      super.isObsecure = value;
    });
  }

  final _$stateAtom = Atom(name: '_SignInViewModelBase.state');

  @override
  SignInState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SignInState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$doSignInAsyncAction = AsyncAction('_SignInViewModelBase.doSignIn');

  @override
  Future<void> doSignIn(context) {
    return _$doSignInAsyncAction.run(() => super.doSignIn(context));
  }

  final _$_SignInViewModelBaseActionController =
      ActionController(name: '_SignInViewModelBase');

  @override
  void changeObsecureState() {
    final _$actionInfo = _$_SignInViewModelBaseActionController.startAction(
        name: '_SignInViewModelBase.changeObsecureState');
    try {
      return super.changeObsecureState();
    } finally {
      _$_SignInViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isObsecure: ${isObsecure},
state: ${state}
    ''';
  }
}
