// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  final _$stateAtom = Atom(name: '_HomeViewModelBase.state');

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$listFirendsAtom = Atom(name: '_HomeViewModelBase.listFirends');

  @override
  List<ResUser> get listFirends {
    _$listFirendsAtom.reportRead();
    return super.listFirends;
  }

  @override
  set listFirends(List<ResUser> value) {
    _$listFirendsAtom.reportWrite(value, super.listFirends, () {
      super.listFirends = value;
    });
  }

  final _$userDetailAtom = Atom(name: '_HomeViewModelBase.userDetail');

  @override
  ResUserDetail? get userDetail {
    _$userDetailAtom.reportRead();
    return super.userDetail;
  }

  @override
  set userDetail(ResUserDetail? value) {
    _$userDetailAtom.reportWrite(value, super.userDetail, () {
      super.userDetail = value;
    });
  }

  final _$messageAtom = Atom(name: '_HomeViewModelBase.message');

  @override
  String? get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String? value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$getFriendsAsyncAction = AsyncAction('_HomeViewModelBase.getFriends');

  @override
  Future<void> getFriends() {
    return _$getFriendsAsyncAction.run(() => super.getFriends());
  }

  final _$getMyProfileAsyncAction =
      AsyncAction('_HomeViewModelBase.getMyProfile');

  @override
  Future<void> getMyProfile() {
    return _$getMyProfileAsyncAction.run(() => super.getMyProfile());
  }

  @override
  String toString() {
    return '''
state: ${state},
listFirends: ${listFirends},
userDetail: ${userDetail},
message: ${message}
    ''';
  }
}
