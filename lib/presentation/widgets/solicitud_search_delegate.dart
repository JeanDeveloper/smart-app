import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/presentation/blocs/contractor/solicitud/solicitud_bloc.dart';
import 'package:smart/presentation/screens/contractor/request/widgets/card_request.dart';

class SolicitudSearchDelegate extends SearchDelegate{

  final Bloc<SolicitudEvent, SolicitudState> requestBloc;
  SolicitudSearchDelegate(this.requestBloc);

  @override
  String? get searchFieldLabel => "Busca tu Solicitud";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '', 
        icon: const Icon(Icons.clear)
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      }, 
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder(
      bloc: requestBloc,
      builder: (BuildContext context,  SolicitudState state) {

        if( state is SolicitudLoading ){
          return const Center(child: CircularProgressIndicator());
        }

        if( state is SolicitudError){
          return Center(child: Text( state.message));
        }

        if( state is SolicitudLoaded ){
          final requests = state.requests;
          if( requests.isEmpty ) return const _EmptyContainer();
          final  filterRequest  =  requests.where(
            (x) => x.cabecera.toString().toLowerCase() == query.trim().toLowerCase() ||
            x.nombre.toLowerCase() == query.trim().toLowerCase()
          ).toList();

          if(filterRequest.isEmpty) return const _EmptyContainer();

          return ListView.builder(
            itemCount: filterRequest.length,
            itemBuilder: ( _ , i) =>Padding(
              padding: const EdgeInsets.all(10.0),
              child: CardRequest(request: filterRequest[i]),
            ), 
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return BlocBuilder(
      bloc: requestBloc,
      builder: (BuildContext context,  SolicitudState state) {

        if( state is SolicitudLoading ){
          return const Center(child: CircularProgressIndicator());
        }

        if( state is SolicitudError){
          return Center(child: Text( state.message));
        }

        if( state is SolicitudLoaded ){
          final requests = state.requests;
          if( requests.isEmpty ) return const _EmptyContainer();
          final  filterRequest  =  requests.where(
            (x) => x.cabecera.toString().toLowerCase().contains(query.trim().toLowerCase()) ||
            x.subsede.toLowerCase().contains(query.trim().toLowerCase())
          ).toList();

          if(filterRequest.isEmpty) return const _EmptyContainer();

          return ListView.builder(
            itemCount: filterRequest.length,
            itemBuilder: ( _ , i) =>Padding(
              padding: const EdgeInsets.all(10.0),
              child: CardRequest(request: filterRequest[i]),
            ), 
          );
        }

        return const Center(child: CircularProgressIndicator());

      },
    );

  }

}

class _EmptyContainer extends StatelessWidget {
  const _EmptyContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(Icons.hourglass_empty_outlined, color: Colors.black38, size: 100),
    );
  }
}


