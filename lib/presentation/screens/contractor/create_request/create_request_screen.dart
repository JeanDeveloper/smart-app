import 'dart:convert';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/global/constants.dart';
import 'package:smart/domain/request/request_request.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/blocs/contractor/campus/campus_bloc.dart';
import 'package:smart/presentation/blocs/contractor/create_request/create_request_bloc.dart';
import 'package:smart/presentation/blocs/contractor/entry_type/entry_type_bloc.dart';
import 'package:smart/presentation/blocs/contractor/representative/representative_bloc.dart';
import 'package:smart/presentation/blocs/contractor/solicitud/solicitud_bloc.dart';
import 'package:smart/presentation/blocs/contractor/sucursal/sucursal_bloc.dart';
import 'package:smart/presentation/theme/theme.dart';
import 'package:smart/presentation/widgets/entry_type_dropdown.dart';
import 'package:smart/presentation/widgets/representative_dropdown.dart';
import 'package:smart/presentation/widgets/widgets.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:crypto/crypto.dart';

class CreateRequestScreen extends StatefulWidget {

  final EntryTypeBloc entryTypeBloc;
  final SucursalBloc sucursalBloc;
  final CampusBloc campusBloc;
  final RepresentativeBloc representativeBloc;
  final CreateRequestBloc createRequestBloc;
  final SolicitudBloc solicitudBloc;

  const CreateRequestScreen({super.key, required this.entryTypeBloc, required this.sucursalBloc, required this.campusBloc, required this.representativeBloc, required this.createRequestBloc, required this.solicitudBloc});

  @override
  State<CreateRequestScreen> createState() => _CreateRequestScreenState();
}

class _CreateRequestScreenState extends State<CreateRequestScreen> {

  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  List<DateTime?>? _startDate ;
  List<DateTime?>? _endDate ;

  @override
  void initState() {
    final user = BlocProvider.of<AuthBloc>(context).user;
    widget.entryTypeBloc.add(EntryTypeInitialEvent(user!.codCliente));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final user = BlocProvider.of<AuthBloc>(context).user;

    initializeDateFormatting('es');

    return BlocListener(
      bloc: widget.createRequestBloc,
      listener:  (context, state) {
        if(  state  is CreateRequestLoaded ){
          Navigator.of(context).pop();
          widget.solicitudBloc.add(InitialEvent(user!.codEmpresa, user.codCliente));
          // BlocProvider.of<SolicitudBloc>(context).add(InitialEvent(user!.codEmpresa, user.codCliente));
        }
      },

      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Solicitud"),
            centerTitle: true,
            elevation: 0.5,
          ),
          body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:[

                  const SizedBox(height: 20),

                  BlocBuilder(
                    bloc: widget.entryTypeBloc,
                    builder: (context, state) {
                      if( state is EntryTypeLoading ) return ShimmerWidget(width: size.width, height: size.height * .06);
                      if( state is EntryTypeLoaded  ) {
                      final entryTypes =  state.entryTypes;
                        return EntryTypeDropDownButton( managerBloc: widget.createRequestBloc, hintText: "Seleccione el Tipo de Ingreso", entryTypes: entryTypes);
                      }
                      return ShimmerWidget(width: size.width, height: size.height * .08);
                    },
                  ),

                  const SizedBox(height: 20),

                  BlocBuilder(
                    bloc: widget.entryTypeBloc,
                    builder: (context, state) {
                      if( state is EntryTypeLoading ) return ShimmerWidget(width: size.width, height: size.height * .06);
                      if( state is EntryTypeLoaded ) {
                        return ContextDropDownButton( managerBloc: widget.createRequestBloc, hintText: "Seleccione el Ambito", contexTypes: Constants.contexts, sucursalBloc: widget.sucursalBloc);
                      }
                      return ShimmerWidget(width: size.width, height: size.height * .08);
                    },
                  ),

                  const SizedBox(height: 20),

                  BlocBuilder(
                    bloc: widget.sucursalBloc,
                    builder: (context, state) {
                      if( state is SucursalLoading ) return ShimmerWidget(width: size.width, height: size.height * .06);
                      if( state is SucursalLoaded ) {
                        final sucursales =  state.sucursales;
                        return SucursalDropDownButton( managerBloc: widget.createRequestBloc, hintText: "Seleccione la sucursal", sucursales: sucursales, campusBloc:widget.campusBloc, representativeBloc: widget.representativeBloc );
                      }
                      return ShimmerWidget(width: size.width, height: size.height * .08);
                    },
                  ),

                  const SizedBox(height: 20),

                  BlocBuilder(
                    bloc: widget.campusBloc,
                    builder: (context, state) {
                      if( state is CampusLoading ) return ShimmerWidget(width: size.width, height: size.height * .06);
                      if( state is CampusLoaded ) {
                        final campus =  state.campus;
                        return CampusDropDownButton( managerBloc: widget.createRequestBloc, hintText: "Seleccione la sucursal", campus: campus);
                      }
                      return ShimmerWidget(width: size.width, height: size.height * .08);
                    },
                  ),

                  const SizedBox(height: 30),

                  BlocBuilder(
                    bloc: widget.representativeBloc,
                    builder: (context, state) {
                      if( state is RepresentativeLoading ) return ShimmerWidget(width: size.width, height: size.height * .06);
                      if( state is RepresentativeLoaded ) {
                        final representatives =  state.representative;
                        return RepresentativeDropDownButton( managerBloc: widget.createRequestBloc, hintText: "Seleccione un representante", representative: representatives);
                      }
                      return ShimmerWidget(width: size.width, height: size.height * .08);
                    },
                  ),

                  const SizedBox(height: 20),

                  RequestDatePicker(
                    textLabel: "Ingrese la Fecha de Inicio",
                    onTap: () async {
                      _startDate = await showCalendarDatePicker2Dialog(
                        context: context,
                        config: CalendarDatePicker2WithActionButtonsConfig(
                          cancelButton: const Text('Cancelar'),
                          okButton: const Text('Aceptar'),
                          calendarType: CalendarDatePicker2Type.single
                        ),
                        dialogSize: const Size(325, 400),
                        // initialValue: [],
                        borderRadius: BorderRadius.circular(15),
                      );
                      setState(() {
                        widget.createRequestBloc.starDate = _startDate?.first;
                      });
                    },
                    date: _startDate,
                  ),

                  const SizedBox(height: 20),

                  RequestDatePicker(
                    date: _endDate,
                    textLabel: "Ingrese la Fecha de Fin",
                    onTap: () async {
                      _endDate = await showCalendarDatePicker2Dialog(
                        context: context,
                        config: CalendarDatePicker2WithActionButtonsConfig(
                          cancelButton: const Text('Cancelar'),
                          okButton: const Text('Aceptar'),
                          calendarType: CalendarDatePicker2Type.single
                        ),
                        dialogSize: const Size(325, 400),
                        // initialValue: [],
                        borderRadius: BorderRadius.circular(15),
                      );
                      setState(() {
                        widget.createRequestBloc.endDate = _endDate?.first;
                      });
                    },
                  ),

                  const Spacer(),

                  BlocBuilder(
                    bloc: widget.createRequestBloc,
                    builder:  (context, state) {

                      return Center(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: const MaterialStatePropertyAll( EdgeInsets.symmetric(horizontal: 100, vertical: 20)),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            backgroundColor: const MaterialStatePropertyAll(SmartColors.blue)
                          ),
                          onPressed: ( state is CreateRequestLoading)
                            ? null
                            :(){
                              if( _formKey.currentState!.validate() ){
                                final request = CreateRequestRequest(
                                  widget.createRequestBloc.entryType!.codigo,
                                  user!.codCliente,
                                  user.codEmpresa,
                                  widget.createRequestBloc.sucursal!.codigo,
                                  widget.createRequestBloc.campus!.codigo,
                                  int.parse(widget.createRequestBloc.representative!.codigoPers),
                                  widget.createRequestBloc.starDate!,
                                  widget.createRequestBloc.endDate!,
                                  user.userName,
                                  true,
                                  widget.createRequestBloc.contextType!.codigo,
                                );
                                widget.createRequestBloc.add(AddRequestEvent(request));
                                _formKey.currentState!.save();
                              }
                            },
                          child: ( state is CreateRequestLoading ) 
                            ? const Center(child: CircularProgressIndicator()) 
                            : const Text("Crear Solicitud"),   
                        ),
                      );

                    }, 
                  ),

                  SizedBox(height: size.height * .05),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}