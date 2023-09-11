part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingGetINFO extends HomeState {}

class SuccessGetINFO extends HomeState {}

class ErrorGetINFO extends HomeState {}

class LoadingGetGlobal extends HomeState {}

class SuccessGetGlobal extends HomeState {}

class ErrorGetGlobal extends HomeState {}

class LoadingGetUnq extends HomeState {}

class SuccessGetUnq extends HomeState {}

class ErrorGetUnq extends HomeState {}

class LoadingGetEvent extends HomeState {}

class SuccessGetEvent extends HomeState {}

class ErrorGetEvent extends HomeState {}

class Changepage extends HomeState {}

class ChangepageIndex extends HomeState {}

class ChangePyment extends HomeState {}

class PaymentLoading extends HomeState {}

class PaymentKioskSuccess extends HomeState {}

class PaymentCardSuccess extends HomeState {}

class ImageSuccess extends HomeState {}

class ImageError extends HomeState {}

class ImageLoading extends HomeState {}

class ImageNullState extends HomeState {}

class BuyDarkPointLoading extends HomeState {}

class BuyDarkPointSuccess extends HomeState {}

class BuyDarkPointError extends HomeState {}

class SellDarkPointLoading extends HomeState {}

class SellDarkPointSuccess extends HomeState {}

class SellDarkPointError extends HomeState {}
