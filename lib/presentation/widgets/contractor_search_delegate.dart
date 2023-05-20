import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/presentation/blocs/admin/contractor/contractor_bloc.dart';

import '../screens/admin/contractor/widgets/widgets.dart';

class ContractorSearchDelegate extends SearchDelegate{

  final Bloc<ContractorEvent, ContractorState> contractorBloc;
  ContractorSearchDelegate(this.contractorBloc);

  @override
  String? get searchFieldLabel => "Busca al contratista";

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
      bloc: contractorBloc,
      builder: (BuildContext context,  ContractorState state) {

        if( state is ContractorLoading ){
          return const Center(child: CircularProgressIndicator());
        }

        if( state is ContractorError){
          return Center(child: Text( state.message));
        }

        if( state is ContractorLoaded ){
          final contractors = state.contractors;
          if( contractors.isEmpty ) return const _EmptyContainer();
          final  filterContractors  =  contractors.where(
            (x) => x.ruc.toString().toLowerCase() == query.trim().toLowerCase() || 
            x.razonSocial.toString().toLowerCase() == query.trim().toLowerCase()

          ).toList();

          if(filterContractors.isEmpty) return const _EmptyContainer();

          return ListView.builder(
            itemCount: filterContractors.length,
            itemBuilder: ( _ , i) =>Padding(
              padding: const EdgeInsets.all(10.0),
              child: CardContractor(contractor: filterContractors[i]),
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
      bloc: contractorBloc,
      builder: (BuildContext context,  ContractorState state) {

        if( state is ContractorLoading ){
          return const Center(child: CircularProgressIndicator());
        }

        if( state is ContractorError){
          return Center(child: Text( state.message));
        }

        if( state is ContractorLoaded ){
          final contractors = state.contractors;
          if( contractors.isEmpty ) return const _EmptyContainer();
          final  filterContractors  =  contractors.where(
            (x) => x.ruc.toString().toLowerCase().contains(query.trim().toLowerCase()) || 
            x.razonSocial.toString().toLowerCase().contains(query.trim().toLowerCase())
          ).toList();

          if(filterContractors.isEmpty) return const _EmptyContainer();

          return ListView.builder(
            itemCount: filterContractors.length,
            itemBuilder: ( _ , i) =>Padding(
              padding: const EdgeInsets.all(10.0),
              child: CardContractor(contractor: filterContractors[i]),
            ), 
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );



    // if( query.isEmpty ) return const _EmptyContainer();
    // final contractors = BlocProvider.of<ContractorBloc>(context).contractors;

    // if( contractors.isEmpty ) return const _EmptyContainer();
    // final  filterContractors  =  contractors.where(
    //   (x) => x.ruc.toString().toLowerCase().contains(query.trim().toLowerCase()) || 
    //   x.razonSocial.toString().toLowerCase().contains(query.trim().toLowerCase())
    // ).toList();

    // if(filterContractors.isEmpty) return const _EmptyContainer();

    // return ListView.builder(
    //   itemCount: filterContractors.length,
    //   itemBuilder: ( _ , i) =>Padding(
    //     padding: const EdgeInsets.all(10.0),
    //     child: CardContractor(contractor: filterContractors[i]),
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