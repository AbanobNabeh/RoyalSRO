part of 'event_cubit.dart';

abstract class EventState {}

class EventInitial extends EventState {}

class CheckSpinLoading extends EventState {}

class CheckSpinSuccess extends EventState {}

class CheckSpinError extends EventState {}

class LuckySpinLoading extends EventState {}

class LuckySpinSuccess extends EventState {}

class LuckySpinError extends EventState {}

class VIPCheckLoading extends EventState {}

class VIPCheckSuccess extends EventState {}

class VIPCheckError extends EventState {}

class VIPCollectkLoading extends EventState {}

class VIPCollectkSuccess extends EventState {}

class VIPCollectkError extends EventState {}

class GetPostLoading extends EventState {}

class GetPostSuccess extends EventState {}

class GetPostError extends EventState {}

class ImageSuccess extends EventState {}

class ImageError extends EventState {}

class ImgRemoveLoading extends EventState {}

class ImgRemove extends EventState {}

class ImageLoading extends EventState {}

class ImgState extends EventState {}

class UploadPOSTLoading extends EventState {}

class UploadPOSTSuccess extends EventState {}

class UploadPOSTError extends EventState {}

class CheckRate extends EventState {}

class AddReviewLoading extends EventState {}

class AddReviewSuccess extends EventState {}

class AddReviewError extends EventState {}

class CheckIniteLoading extends EventState {}

class CheckIniteSuccess extends EventState {}

class CheckIniteError extends EventState {}

class CreateCodeLoading extends EventState {}

class CreateCodeSuccess extends EventState {}

class CreateCodeError extends EventState {}

class GETCodeRedemLoading extends EventState {}

class GETCodeRedemSuccess extends EventState {}

class GETCodeRedemError extends EventState {}

class GiftCheckLoading extends EventState {}

class GiftCheckSuccess extends EventState {}

class GiftCheckError extends EventState {}

class CollectGiftLoading extends EventState {}

class CollectGiftSuccess extends EventState {}

class CollectGiftError extends EventState {}

class LoadingAlchemy extends EventState {}

class RoyalPassGetLoading extends EventState {}

class RoyalPassGetSuccess extends EventState {}

class RoyalPassGetError extends EventState {}

class AlchemyGetLoading extends EventState {}

class AlchemyGetSuccess extends EventState {}

class AlchemyGetError extends EventState {}

class BackToMission extends EventState {}

class SetItem extends EventState {}

class ChangeState extends EventState {}

class LoadingAddNightMarket extends EventState {}

class SuccessgAddNightMarket extends EventState {}

class ErrorgAddNightMarket extends EventState {}

class ChanmgeFilterState extends EventState {}

class GetNightMarketLoading extends EventState {}

class GetNightMarketSuccess extends EventState {}

class GetNightMarketError extends EventState {}

class BuyNightMarketLoading extends EventState {}

class BuyNightMarketSuccess extends EventState {}

class BuyNightMarketError extends EventState {}

class DeleteOfferLoading extends EventState {}

class DeleteOfferSuccess extends EventState {}

class DeleteOfferError extends EventState {}
