part of 'mission_cubit.dart';

abstract class MissionState {}

class MissionInitial extends MissionState {}

class ChangePageIndex extends MissionState {}

class ChangeweekIndex extends MissionState {}

class GetWeekLoading extends MissionState {}

class GetMissionLoading extends MissionState {}

class GetMissionSuccess extends MissionState {}

class GetMissionError extends MissionState {}

class CollectPointLoading extends MissionState {}

class CollectPointSuccess extends MissionState {}

class CollectPointError extends MissionState {}

class CheckDailyLoading extends MissionState {}

class CheckDailySuccess extends MissionState {}

class CheckDailyError extends MissionState {}

class ColectRwLoading extends MissionState {}

class ColectRwSuccess extends MissionState {}

class ColectRwError extends MissionState {}
