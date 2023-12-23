import 'package:driver_monitoring_application/models/delivery_model.dart';
import 'package:driver_monitoring_application/services/deliveries_service.dart';
import 'package:driver_monitoring_application/services/injectible/injectible_init.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future<void> getUserDeliveries(String userId) async {
    var deliveries = await getIt<DeliveriesService>().getUserDeliveries(userId);
    emit(HomeLoadedState(deliveries: deliveries));
  }

  Future<void> getChiefDeliveries() async {
    var deliveries = await getIt<DeliveriesService>().getChiefDeliveries();
    emit(HomeLoadedState(deliveries: deliveries));
  }
}
