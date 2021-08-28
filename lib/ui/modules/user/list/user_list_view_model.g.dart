// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserListViewModel on _UserListViewModelBase, Store {
  final _$stateAtom = Atom(name: '_UserListViewModelBase.state');

  @override
  UserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(UserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$listUserAtom = Atom(name: '_UserListViewModelBase.listUser');

  @override
  List<ResUser> get listUser {
    _$listUserAtom.reportRead();
    return super.listUser;
  }

  @override
  set listUser(List<ResUser> value) {
    _$listUserAtom.reportWrite(value, super.listUser, () {
      super.listUser = value;
    });
  }

  final _$getUsersAsyncAction = AsyncAction('_UserListViewModelBase.getUsers');

  @override
  Future<void> getUsers(dynamic context) {
    return _$getUsersAsyncAction.run(() => super.getUsers(context));
  }

  @override
  String toString() {
    return '''
state: ${state},
listUser: ${listUser}
    ''';
  }
}
