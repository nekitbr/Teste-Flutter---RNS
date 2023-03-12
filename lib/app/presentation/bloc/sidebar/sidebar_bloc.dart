import 'package:bloc/bloc.dart';
import 'package:teste_salcisne/app/presentation/bloc/sidebar/sidebar_event.dart';
import 'package:teste_salcisne/app/presentation/bloc/sidebar/sidebar_state.dart';

class SidebarBloc extends Bloc<DrawerEvent, SidebarState> {
  SidebarBloc() : super();

  @override
  SidebarState get initialState => SidebarState();

  @override
  Stream<SidebarState> mapEventToState(DrawerEvent event) async* {
    if (event is SidebarSelectItemEvent) {
      yield state.copyWith(selectedIndex: event.index);
    } else if (event is SidebarOpenEvent) {
      yield state.copyWith(isOpen: true);
    } else if (event is SidebarCloseEvent) {
      yield state.copyWith(isOpen: false);
    }
  }
}