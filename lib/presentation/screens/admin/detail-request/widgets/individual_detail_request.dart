import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/screens/admin/detail-request/widgets/widgets.dart';
import 'package:smart/presentation/blocs/admin/detail_request/person_request/person_request_bloc.dart';


class IndividualDetailRequest extends StatefulWidget {

  final Solicitud request;
  const IndividualDetailRequest({super.key, required this.request});

  @override
  State<IndividualDetailRequest> createState() => _IndividualDetailRequestState();
}

class _IndividualDetailRequestState extends State<IndividualDetailRequest> {

@override
  void initState() {
    final user =  BlocProvider.of<AuthBloc>(context).user;
    BlocProvider.of<PersonRequestBloc>(context).add( PersonRequestInitialEvent( "${widget.request.code}", user!.userName ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<PersonRequestBloc, PersonRequestState>(
      builder: (context, state) {

        if( state is PersonRequestInitial ) BlocProvider.of<PersonRequestBloc>(context).add( PersonRequestInitialEvent( "${widget.request.code}",  BlocProvider.of<AuthBloc>(context).user!.userName ));

        if( state is PersonRequestLoading ) const Center(child: CircularProgressIndicator());

        if( state is PersonRequestError )   Center(child: Text(state.message));

        if( state is PersonRequestLoaded ){

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