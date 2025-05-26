class ChatState {
  final int selectedIndex;

  ChatState({this.selectedIndex = 0});

  ChatState copyWith({int? selectedIndex}) {
    return ChatState(selectedIndex: selectedIndex ?? this.selectedIndex);
  }
}
