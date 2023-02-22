import 'package:estudos_bloc/pages/bloc/home_bloc.dart';
import 'package:estudos_bloc/pages/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePages extends StatelessWidget {
  const HomePages({super.key});

  // late HomeBloc bloc;

  // @override
  // void initState() {
  //   bloc = BlocProvider.of<HomeBloc>(context);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exemplo Bloc"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
          bloc: BlocProvider.of<HomeBloc>(context),
          builder: (context, state) {
            if (state is HomeStateLoaded)
              return ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Item $index'),
                  );
                },
              );
            if (state is HomeErrorState) {
              return Center(
                child: Text(state.message),
              );
            }
            if (state is HomeStateEmptyList) {
              return const Center(
                child: Text("Não a dados disponiveis"),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
