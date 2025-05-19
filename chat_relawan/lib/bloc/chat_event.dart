abstract class ChatEvent {}

class ChangeTabEvent extends ChatEvent {
  final int index;

  ChangeTabEvent(this.index);
}
