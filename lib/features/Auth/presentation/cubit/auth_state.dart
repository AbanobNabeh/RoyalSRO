part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class CheckUserLoading extends AuthState {}

class CheckUserSuccess extends AuthState {}

class CheckUserError extends AuthState {}

class ChangePassVisi extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginError extends AuthState {}

class SelectCharLoading extends AuthState {}

class SelectCharSuccess extends AuthState {}

class SelectCharError extends AuthState {}

class ChangeStateSave extends AuthState {}

class SignUpLoading extends AuthState {}

class SignUpSuccess extends AuthState {}

class SignUpError extends AuthState {}

class ChangeBTNConf extends AuthState {}
