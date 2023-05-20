import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/context_type.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/blocs/contractor/create_request/create_request_bloc.dart';
import 'package:smart/presentation/blocs/contractor/sucursal/sucursal_bloc.dart';

class ContextDropDownButton extends StatelessWidget {

  final String hintText;
  final List<ContextType> contexTypes;
  final SucursalBloc sucursalBloc;
  final CreateRequestBloc managerBloc;


  const ContextDropDownButton({
    super.key, 
    required this.hintText, 
    required this.contexTypes, 
    required this.sucursalBloc, 
    required this.managerBloc
  });


  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final user = BlocProvider.of<AuthBloc>(context).user;

    return DropdownButtonFormField2(
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
      items: contexTypes.map((type) => DropdownMenuItem(value: type,child: Text(StringUtils.converString(type.descripcion), style: const TextStyle(fontSize: 14)))).toList(),

      validator: (value) {
        if (value == null) {
          return 'Por favor Seleccione el Ambito';
        }
        return null;
      },

      onChanged: (value) {
        managerBloc.contextType = value;
        sucursalBloc.add(SucursalInitialEvent(user!.codCliente, value!.codigo.toString()));
      },

      onSaved: (value) {
        // selectedValue = value.toString();
      },

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