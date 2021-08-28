// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_detail_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileDetailViewModel on _ProfileDetailViewModelBase, Store {
  final _$isOwnerAtom = Atom(name: '_ProfileDetailViewModelBase.isOwner');

  @override
  bool get isOwner {
    _$isOwnerAtom.reportRead();
    return super.isOwner;
  }

  @override
  set isOwner(bool value) {
    _$isOwnerAtom.reportWrite(value, super.isOwner, () {
      super.isOwner = value;
    });
  }

  final _$userDetailAtom = Atom(name: '_ProfileDetailViewModelBase.userDetail');

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

  final _$messageAtom = Atom(name: '_ProfileDetailViewModelBase.message');

  @override
  String get message {
    _$messageAtom.reportRead();
    return super.message;
  }

  @override
  set message(String value) {
    _$messageAtom.reportWrite(value, super.message, () {
      super.message = value;
    });
  }

  final _$stateAtom = Atom(name: '_ProfileDetailViewModelBase.state');

  @override
  ProfileDetailState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ProfileDetailState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$getProfileDetailAsyncAction =
      AsyncAction('_ProfileDetailViewModelBase.getProfileDetail');

  @override
  Future<void> getProfileDetail(String userId) {
    return _$getProfileDetailAsyncAction
        .run(() => super.getProfileDetail(userId));
  }

  @override
  String toString() {
    return '''
isOwner: ${isOwner},
userDetail: ${userDetail},
message: ${message},
state: ${state}
    ''';
  }
}
