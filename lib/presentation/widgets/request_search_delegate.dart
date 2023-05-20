import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/presentation/blocs/admin/request/request_bloc.dart';
import 'package:smart/presentation/screens/admin/requests/widgets/card_request.dart';

class RequestSearchDelegate extends SearchDelegate{

  final Bloc<RequestEvent, RequestState> requestBloc;
  RequestSearchDelegate(this.requestBloc);

  @override
  String? get searchFieldLabel => "Busca tu solicitud";

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
      builder: (BuildContext context,  RequestState state) {

        if( state is RequestLoading ){
          return const Center(child: CircularProgressIndicator());
        }

        if( state is RequestError){
          return Center(child: Text( state.message));
        }

        if( state is RequestLoaded ){
          final requests = state.requests;
          if( requests.isEmpty ) return const _EmptyContainer();
          final  filterRequest  =  requests.where(
            (x) => x.code.toString().toLowerCase() == query.trim().toLowerCase() ||
            x.enterPrise.toLowerCase() == query.trim().toLowerCase()
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
      builder: (BuildContext context,  RequestState state) {

        if( state is RequestLoading ){
          return const Center(child: CircularProgressIndicator());
        }

        if( state is RequestError){
          return Center(child: Text( state.message));
        }

        if( state is RequestLoaded ){
          final requests = state.requests;
          if( requests.isEmpty ) return const _EmptyContainer();
          final  filterRequest  =  requests.where(
            (x) => x.code.toString().toLowerCase().contains(query.trim().toLowerCase()) ||
            x.enterPrise.toLowerCase().contains(query.trim().toLowerCase())
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



    // final requests = requestBloc.state == 
    // final requests = BlocProvider.of<RequestBloc>(context).requests;
    // if( requests.isEmpty ) return const _EmptyContainer();
    // final  filterRequest  =  requests.where(
    //   (x) => x.code.toString().toLowerCase().contains(query.trim().toLowerCase()) ||
    //   x.enterPrise.toLowerCase().contains(query.trim().toLowerCase())
    // ).toList();

    // if(filterRequest.isEmpty) return const _EmptyContainer();

    // return ListView.builder(
    //   itemCount: filterRequest.length,
    //   itemBuilder: ( _ , i) =>Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: CardRequest(request: filterRequest[i]),
    //   ), 
    // );
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


