import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imunetra/models/OnBoarding_models.dart';
import 'package:imunetra/services/onBoard_service.dart';

class OnboardingState {
  final int currentPage;
  final List<OnboardingModel> pages;

  OnboardingState({required this.currentPage, required this.pages});
}

class OnboardingCubit extends Cubit<OnboardingState> {
  final OnboardingService _service;

  OnboardingCubit(this._service)
      : super(OnboardingState(currentPage: 0, pages: _service.getOnboardingData()));

  void nextPage() {
    if (state.currentPage < state.pages.length - 1) {
      emit(OnboardingState(currentPage: state.currentPage + 1, pages: state.pages));
    }
  }

  void skipToEnd() {
    emit(OnboardingState(currentPage: state.pages.length - 1, pages: state.pages));
  }

  void updatePage(int index) {
    emit(OnboardingState(currentPage: index, pages: state.pages));
  }
}
