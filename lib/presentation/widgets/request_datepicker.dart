import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:smart/presentation/theme/theme.dart';

class RequestDatePicker extends StatelessWidget {
  final Function()? onTap;
  final String textLabel;
  final List<DateTime?>? date ;

  const RequestDatePicker({super.key, this.onTap, this.date, required this.textLabel});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(

      onTap: onTap,

      // onTap: () async {
      //   await showCalendarDatePicker2Dialog(
      //     context: context,
      //     config: CalendarDatePicker2WithActionButtonsConfig(
      //       cancelButton: const Text('Cancelar'),
      //       okButton: const Text('Aceptar'),
      //       calendarType: CalendarDatePicker2Type.single
      //     ),
      //     dialogSize: const Size(325, 400),
      //     // initialValue: [],
      //     borderRadius: BorderRadius.circular(15),
      //   );
      // },

      child: Container(
        height: size.height * .06,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.grey.shade400,
            width: 2,
          )
        ),
        // child: const Text('Seleccione la fecha de inicio'),
        child:  ( date  == null)
          ? Text(textLabel)
          : Text(DateFormat('EEEE, d MMMM yyyy', 'es').format(date!.first!)),
      ),

    );

  }
}