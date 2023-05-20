import 'package:flutter/material.dart';
import 'package:smart/core/global/constants.dart';
import 'package:smart/presentation/screens/admin/requests/widgets/widgets.dart';

class StateContainer extends StatelessWidget {

  final int index;
  final ValueChanged<int> onIndexSelected;

  const StateContainer({
    required this.onIndexSelected, 
    required this.index
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .05,
      width:  double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Constants.statesRequest.length,
        itemBuilder: ( _ , i ) => InkWell(
          onTap: () => onIndexSelected(i),
          child: ButtonState(
            textButton: Constants.statesRequest[i], 
            isActive: (index == i) ? true :false,
          ),
        ),
      ),
    );

  }
}