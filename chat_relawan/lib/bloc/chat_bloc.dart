import 'package:flutter_bloc/flutter_bloc.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState()) {
    on<ChangeTabEvent>((event, emit) {
      emit(state.copyWith(selectedIndex: event.index));
    });
  }
}
