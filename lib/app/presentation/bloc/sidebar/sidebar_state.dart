class SidebarState {
  final int selectedIndex;
  final bool isOpen;

  SidebarState({this.selectedIndex = 0, this.isOpen = false});

  SidebarState copyWith({int selectedIndex, bool isOpen}) => SidebarState(
    selectedIndex: selectedIndex ?? this.selectedIndex,
    isOpen: isOpen ?? this.isOpen,
  );
}
