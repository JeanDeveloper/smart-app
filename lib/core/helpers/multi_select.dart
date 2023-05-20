import 'package:flutter/material.dart';
import 'package:smart/core/utils/string.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/domain/entities/general_person_doc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:smart/presentation/blocs/admin/person/general_person_doc/general_person_doc_bloc.dart';

void showSheetMultiSelect( BuildContext context, int codCabecera, int codDocumento ) async{

  await showModalBottomSheet(
    isScrollControlled: true, 
    context: context,
    builder: (ctx) {
      return BlocBuilder<GeneralPersonDocBloc, GeneralPersonDocState>(
        builder: (context, state) {

          final size = MediaQuery.of(context).size;

          if( state is GeneralPersonDocLoading ){
            return Container( padding: EdgeInsets.symmetric(horizontal:  size.aspectRatio * 330 , vertical:  size.aspectRatio * 300 ), child: const  CircularProgressIndicator());
          }

          if( state is GeneralPersonDocError ){
            return const Center(child: Text("Error en el servidor"));
          }

          if( state is GeneralPersonDocLoaded ){
            final listsPerson        = state.personsList;
            final multiSelectItems   = listsPerson.map((person) => MultiSelectItem<GeneralPersonDoc>( person, "${StringUtils.converString(person.fullname)}\nEmision:${StringUtils.converString(person.fechaEmision)}\nCaducidad:${StringUtils.converString(person.fechaCaducidad)}")).toList();
            final multiSelectedItems = listsPerson.where((x) => x.cumplio == true ).toList();
            return MultiSelectBottomSheet<GeneralPersonDoc>(
              title: const Text("Lista de Personal"),
              items: multiSelectItems,
              initialValue: multiSelectedItems,
              maxChildSize: 0.9,
              onConfirm: ( selectedPersons ) {
                BlocProvider.of<GeneralPersonDocBloc>(context).add(AddPersonDocGenEvent( listsPerson, multiSelectedItems, selectedPersons, codCabecera, codDocumento));
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      );
    },
  );
}