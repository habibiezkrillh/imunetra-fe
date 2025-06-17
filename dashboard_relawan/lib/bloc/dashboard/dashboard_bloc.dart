import 'package:dashboard_relawan/bloc/dashboard/dashboard_event.dart';
import 'package:dashboard_relawan/bloc/dashboard/dashboard_state.dart';
import 'package:dashboard_relawan/repository/repo_user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ActivityRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<LoadActivities>((event, emit) async {
      emit(HomeLoading());
      try {
        final activities = await repository.getActivities();
        emit(HomeLoaded(activities));
      } catch (_) {
        emit(HomeError("Gagal memuat data"));
      }
    });
  }
}
