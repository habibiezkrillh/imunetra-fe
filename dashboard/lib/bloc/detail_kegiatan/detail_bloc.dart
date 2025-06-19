import 'package:dashboard/bloc/detail_kegiatan/detail_event.dart';
import 'package:dashboard/bloc/detail_kegiatan/detail_state.dart';
import 'package:dashboard/model/dashboard/user_model.dart';
import 'package:dashboard/model/detail_kegiatan/detail_model.dart';
import 'package:dashboard/repository/detailkegiatan/detail_repo.dart';
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
