import 'package:dashboard_relawan/viewmodel/dashboard_viewmodel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardViewModel viewModel;

  DashboardBloc(this.viewModel) : super(DashboardInitial()) {
    on<LoadUserEvent>((event, emit) async {
      emit(DashboardLoading());
      try {
        final user = await viewModel.getUser();
        emit(DashboardLoaded(user));
      } catch (e) {
        emit(DashboardError("Gagal memuat data"));
      }
    });
  }
}
