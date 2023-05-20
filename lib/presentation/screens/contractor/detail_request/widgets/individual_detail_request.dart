
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/domain/entities/contractor_request.dart';
import 'package:smart/presentation/blocs/contractor/detail_request/person_request/person_request_cont_bloc.dart';
import 'package:smart/presentation/screens/contractor/detail_request/widgets/card_person_request.dart';

class IndividualDetailRequest extends StatefulWidget {

  final ContractorRequest request;
  const IndividualDetailRequest({super.key, required this.request});

  @override
  State<IndividualDetailRequest> createState() => _IndividualDetailRequestState();
}

class _IndividualDetailRequestState extends State<IndividualDetailRequest> {


@override
  void initState() {
    BlocProvider.of<PersonRequestContBloc>(context).add( PersonRequestInitialEventCont( widget.request.cabecera));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return BlocBuilder<PersonRequestContBloc, PersonRequestContState>(
      builder: (context, state) {

        if( state is PersonRequestContLoading ) const Center(child: CircularProgressIndicator());

        if( state is PersonRequestContError )   Center(child: Text(state.message));

        if( state is PersonRequestContLoaded ){

          final persons = state.personsRequest;

          if( persons.isEmpty) return const Center(child: Text("No hay informacion"));

          return SizedBox.expand(
            child: ListView.builder(
              itemCount: persons.length,
              itemBuilder: ( _ , i) => CardPersonRequest(personRequest: persons[i], request: widget.request),
            ) 
          );
        }

        return const Center(child: CircularProgressIndicator());

      },
    );

  }
}