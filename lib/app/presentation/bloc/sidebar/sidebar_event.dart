abstract class DrawerEvent {}

class SidebarSelectItemEvent extends DrawerEvent {
  final int index;

  SidebarSelectItemEvent(this.index);
}

class SidebarOpenEvent extends DrawerEvent {}

class SidebarCloseEvent extends DrawerEvent {}
