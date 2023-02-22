import 'package:estudos_bloc/pages/bloc/home_event.dart';
import 'package:estudos_bloc/pages/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(HomeState initialState) : super(HomeLoadingState()) {
    on<HomeFetchList>((event, emit) => fetchList(event, emit));
  }

  void fetchList(HomeFetchList event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    final response = await _fetchList();
    emit(HomeStateLoaded(list: response));
  }

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    var state;
    if (event.runtimeType == HomeFetchList) {
      // yield await _fetchList();
    }
    if (event.runtimeType == HomeFetchListWithError) {
      yield await _fetchListWithError();
    }
    if (event.runtimeType == HomeFetchListWithEmptyList) {
      yield await _fetchListWithEmptyList();
    } else {
      return;
    }
    // switch (event.runtimeType) {
    //   case HomeFetchList:
    //     state = await _fetchList();
    //     break;
    //   case HomeFetchListWithError:
    //     state = await _fetchListWithError();
    //     break;
    //   case HomeFetchListWithEmptyList:
    //     state = await _fetchListWithEmptyList();
    //     break;
    // }
    // yield state;
  }

  Future<List<String>> _fetchList() async {
    var list = await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => <String>[
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
        "Item 1",
      ],
    );
    return list;
  }

  Future<HomeState> _fetchListWithEmptyList() async {
    var list = await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => <String>[],
    );
    return HomeStateLoaded(list: list);
  }

  Future<HomeState> _fetchListWithError() async {
    return await Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () => HomeErrorState(message: "Não foi possivel encontrar os dados"),
    );
  }
}
