import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/document_type.dart';
import 'package:smart/domain/entities/gender.dart';
import 'package:smart/domain/request/person_request.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/blocs/contractor/create_person/create_person_bloc.dart';
import 'package:smart/presentation/theme/theme.dart';

class CreatePersonScreen extends StatefulWidget {
  final CreatePersonBloc createPersonBloc;

  const CreatePersonScreen({super.key, required this.createPersonBloc});

  @override
  State<CreatePersonScreen> createState() => _CreatePersonScreenState();
}

class _CreatePersonScreenState extends State<CreatePersonScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = BlocProvider.of<AuthBloc>(context).user;
    DocumentType? documentType;

    return BlocListener(
      bloc: widget.createPersonBloc,
      listener: (context, state) {
        if( state is CreatePersonLoaded ){
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Creacion de Personal"),
          centerTitle: true,
          elevation: .5,
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    //Tipo de Documento
                    DropdownButtonFormField2<DocumentType>(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        "Ingrese el tipo de documento",
                        style: TextStyle(fontSize: 14),
                      ),
                      items: documentTypes
                          .map((document) => DropdownMenuItem(
                              value: document,
                              child: Text(
                                  StringUtils.converString(document.type),
                                  style: const TextStyle(fontSize: 14))))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Por favor Seleccione el tipo de documento';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        widget.createPersonBloc.typeDocument = value;
                      },
                      onSaved: (value) {},
                      buttonStyleData: ButtonStyleData(
                        height: size.height * .06,
                        padding: const EdgeInsets.only(left: 20, right: 10),
                      ),
                      iconStyleData: IconStyleData(
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
                    ),
                    SizedBox(height: size.height * .04),

                    //Documento
                    TextFormField(
                      keyboardType: TextInputType.number,
                      maxLength:
                          (widget.createPersonBloc.typeDocument?.value == 1)
                              ? 8
                              : 13,
                      validator: (value) {
                        return (value != "")
                            ? null
                            : "Por favor complete este campo";
                      },
                      onChanged: (value) {
                        widget.createPersonBloc.document = value;
                      },
                      cursorHeight: 20,
                      style: TextStyle(
                          fontSize: size.width * .03, color: Colors.black),
                      decoration: const InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                        counterText: '',
                        hintText: "Ingrese el Documento",
                      ),
                    ),
                    SizedBox(height: size.height * .04),

                    //Primer Nombre
                    TextFormField(
                      validator: (value) {
                        return (value != "")
                            ? null
                            : "Por favor complete este campo";
                      },
                      textCapitalization: TextCapitalization.characters,
                      onChanged: (value) {
                        widget.createPersonBloc.name1 = value;
                      },
                      cursorHeight: 20,
                      style: TextStyle(
                          fontSize: size.width * 0.030, color: Colors.black),
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                          counterText: '',
                          hintText: "Ingrese el Primer Nombre"),
                    ),
                    SizedBox(height: size.height * .04),

                    //Segundo Nombre
                    TextFormField(
                      textCapitalization: TextCapitalization.characters,
                      onChanged: (value) {
                        widget.createPersonBloc.name2 = value;
                      },
                      cursorHeight: 20,
                      style: TextStyle(
                          fontSize: size.width * 0.030, color: Colors.black),
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                          counterText: '',
                          hintText: "Ingrese el Segundo Nombre"),
                    ),
                    SizedBox(height: size.height * .04),

                    //Primer Apellido
                    TextFormField(
                      validator: (value) {
                        return (value != "")
                            ? null
                            : "Por favor complete este campo";
                      },
                      textCapitalization: TextCapitalization.characters,
                      onChanged: (value) {
                        widget.createPersonBloc.surname1 = value;
                      },
                      cursorHeight: 20,
                      style: TextStyle(
                          fontSize: size.width * 0.030, color: Colors.black),
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                          counterText: '',
                          hintText: "Ingrese el Primer Apellido"),
                    ),
                    SizedBox(height: size.height * .04),

                    //Segundo Apellido
                    TextFormField(
                      validator: (value) {
                        return (value != "")
                            ? null
                            : "Por favor complete este campo";
                      },
                      textCapitalization: TextCapitalization.characters,
                      onChanged: (value) {
                        widget.createPersonBloc.surname2 = value;
                      },
                      cursorHeight: 20,
                      style: TextStyle(
                          fontSize: size.width * 0.030, color: Colors.black),
                      decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                          counterText: '',
                          hintText: "Ingrese el Segundo Apellido"),
                    ),
                    SizedBox(height: size.height * .04),

                    //Genero
                    DropdownButtonFormField2<Gender>(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      isExpanded: true,
                      hint: const Text(
                        "Ingrese el Genero",
                        style: TextStyle(fontSize: 14),
                      ),
                      items: genders
                          .map((gender) => DropdownMenuItem(
                              value: gender,
                              child: Text(
                                  StringUtils.converString(gender.gender),
                                  style: const TextStyle(fontSize: 14))))
                          .toList(),
                      validator: (value) {
                        if (value == null)
                          return 'Por favor Seleccione el tipo de Genero';
                        return null;
                      },
                      onChanged: (value) {
                        widget.createPersonBloc.gender = value;
                      },
                      onSaved: (value) {},
                      buttonStyleData: ButtonStyleData(
                        height: size.height * .06,
                        padding: const EdgeInsets.only(left: 20, right: 10),
                      ),
                      iconStyleData: IconStyleData(
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
                    ),
                    SizedBox(height: size.height * .04),

                    //Boton
                    BlocBuilder(
                      bloc: widget.createPersonBloc,
                      builder: (context, state) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 100, vertical: 20)
                            ),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            backgroundColor: const MaterialStatePropertyAll(
                                SmartColors.blue)
                          ),
                          onPressed: (state is CreatePersonLoading)
                            ? null
                            : () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                final request  = CreatePersonRequest(
                                  0, 
                                  user!.codCliente, 
                                  user.codEmpresa, 
                                  widget.createPersonBloc.typeDocument!.value, 
                                  widget.createPersonBloc.name1!, 
                                  widget.createPersonBloc.name2?? '', 
                                  widget.createPersonBloc.surname1!,
                                  widget.createPersonBloc.surname2!, 
                                  widget.createPersonBloc.document!, 
                                  (widget.createPersonBloc.gender!.value == 1) ? 'M' : 'F', 
                                  user.userName, 
                                  true
                                );
                                widget.createPersonBloc.add(AddPersonEvent(request));
                              }
                            },
                          child: (state is CreatePersonLoading)
                            ? const Center(child: CircularProgressIndicator())
                            : const Center(child: Text('Crear Personal')),
                        );
                      },
                    ),

                  ],
                ),
              ),
            )),
      ),
    );
  }
}
