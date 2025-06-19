import 'package:dashboard_relawan/bloc/detail_kegiatan/detail_event.dart';
import 'package:dashboard_relawan/bloc/detail_kegiatan/detail_state.dart';
import 'package:dashboard_relawan/model/dashboard/user_model.dart';
import 'package:dashboard_relawan/model/detail_kegiatan/detail_model.dart';
import 'package:dashboard_relawan/repository/detailkegiatan/detail_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ActivityDetailBloc extends Bloc<ActivityDetailEvent, ActivityDetailState> {
  final DetailRepo repository;

  ActivityDetailBloc(this.repository) : super(ActivityDetailInitial()) {
    on<FetchActivityDetail>((event, emit) async {
      emit(ActivityDetailLoading());
      try {
        emit(ActivityDetailLoaded(DetailModel as Activity));
      } catch (e) {
        emit(ActivityDetailError('Gagal memuat detail kegiatan.'));
      }
    });
  }
}
