import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/entry_type.dart';
import 'package:smart/presentation/blocs/contractor/create_request/create_request_bloc.dart';

class EntryTypeDropDownButton extends StatelessWidget {

  final String hintText;
  final List<EntryType> entryTypes;
  final CreateRequestBloc managerBloc;

  const EntryTypeDropDownButton({
    super.key, 
    required this.hintText, 
    required this.entryTypes, 
    required this.managerBloc
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return DropdownButtonFormField2<EntryType>(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        //Add more decoration as you want here
        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
      ),
      isExpanded: true,
      hint: Text(
        hintText,
        style: const TextStyle(fontSize: 14),
      ),
      // items: genderItems.map((type) => DropdownMenuItem(value: type , child: Text(type))).toList(),
      items: entryTypes.map((type) => DropdownMenuItem(value: type,child: Text(StringUtils.converString(type.descripcion), style: const TextStyle(fontSize: 14)))).toList(),
      validator: (value) {
        if (value == null) {
          return 'Por favor Seleccione el tipo de ingreso';
        }
        return null;
      },

      onChanged: (value) {
        managerBloc.entryType = value;
      },
      onSaved: (value) {},

      buttonStyleData: ButtonStyleData(
        height: size.height * .06,
        padding: const EdgeInsets.only(left: 20, right: 10),
      ),
      iconStyleData:  IconStyleData(
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: size.aspectRatio * 70,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );

  }
}