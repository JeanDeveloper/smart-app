import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/person_request_autority.dart';
import 'package:smart/domain/entities/solicitud.dart';
import 'package:smart/presentation/blocs/admin/authority/authority_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';

void showDialogMultiSelect(BuildContext context, Solicitud request) async {
  await showDialog(
    context: context,
    builder: (ctx) {
      return BlocBuilder<AuthorityBloc, AuthorityState>(
        builder: (context, state) {

          if (state is AuthorityLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AuthorityLoaded) {
            final listsPerson = state.persons;
            final qualifiedPeople = listsPerson.where((person) => person.aprobado != 0).toList();
            final List<MultiSelectItem<PersonRequestAutority>> multiSelectItems = qualifiedPeople.map((person) => MultiSelectItem<PersonRequestAutority>(
              person, 
              "${StringUtils.converString(person.fullname)}  \nDoc: ${person.nroDoc} "
            )).toList();
            return MultiSelectDialog<PersonRequestAutority>(
              title: Text("Solicitud ${request.code} - ${request.enterPrise}", style: const TextStyle(fontSize:  13)),
              items: multiSelectItems,
              initialValue: const [],
              confirmText:  const Text("Aceptar"),
              cancelText:   const Text("Cancelar"),
              onConfirm: ( persons ) async {
                bool isComplete = false;
                final user = BlocProvider.of<AuthBloc>(context).user;
                if( persons.length  == qualifiedPeople.length && qualifiedPeople.isNotEmpty ) isComplete = true;
                BlocProvider.of<AuthorityBloc>(context).add( RegisterPersonsEvent(persons, isComplete, request.code, user!.userName));
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      );
    },
  );
}
