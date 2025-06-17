import 'package:equatable/equatable.dart';

abstract class ActivityDetailEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchActivityDetail extends ActivityDetailEvent {
  final String id;

  FetchActivityDetail(this.id);

  @override
  List<Object?> get props => [id];
}
