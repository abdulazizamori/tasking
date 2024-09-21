part of 'ecommerce_cubit.dart';

@immutable
sealed class EcommerceState {}

final class EcommerceInitial extends EcommerceState{}

final class EcommerceLoaded extends EcommerceState{}
