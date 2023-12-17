import 'package:flutter_bloc/flutter_bloc.dart';

part 'drivers_state.dart';

class DriversCubit extends Cubit<DriversState> {
  DriversCubit() : super(DriversLoad());
}
