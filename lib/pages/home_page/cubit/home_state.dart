part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.deliveries = const [],
  });

  final List<DeliveryModel> deliveries;

  @override
  List<Object> get props => [deliveries];

  HomeState copyWith({
    List<DeliveryModel>? deliveries,
  }) {
    return HomeState(
      deliveries: deliveries ?? this.deliveries,
    );
  }
}

final class HomeInitial extends HomeState {}

final class HomeLoadedState extends HomeState {
  const HomeLoadedState({
    super.deliveries,
  });
}
