import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/helpers/get_list_contractor_by_status.dart';
import 'package:smart/domain/response/contractor_response.dart';
import 'package:smart/presentation/blocs/admin/contractor/contractor_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/screens/admin/contractor/widgets/widgets.dart';
import 'package:smart/presentation/theme/theme.dart';
import 'package:smart/presentation/widgets/widgets.dart';


class BodyWidget extends StatefulWidget {

  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {

  int _currentIndex = 0;

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user  = BlocProvider.of<AuthBloc>(context).user;
      BlocProvider.of<ContractorBloc>(context).add(ContractorInitialEvent(user!.codCliente));
    });
      // BlocProvider.of<ObservationBloc>(context).add(ShowObservationsEvent(widget.document.codigo));

    super.initState();

  }

  @override
  Widget build(BuildContext context) {

    final size  = MediaQuery.of(context).size;
    final user  = BlocProvider.of<AuthBloc>(context).user;


    return SingleChildScrollView(
      child: Column(
        children: [

          Padding(
            padding: EdgeInsets.all(size.aspectRatio * 20),
            child: Container(
              height: size.height * .06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 2,
                  color: SmartColors.white
                ),
                color: SmartColors.lightBlue
              ),
              child: InkWell(
                onTap: () => showSearch(
                  context: context, 
                  delegate: ContractorSearchDelegate(BlocProvider.of<ContractorBloc>(context))
                ),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal:8.0),
                      child: Icon(Icons.search, color: Colors.black),
                    ),
                    Expanded(child: Text("Buscar", style: Theme.of(context).inputDecorationTheme.labelStyle!.copyWith(color: SmartColors.white)))
                  ],
                ),
              ),
            ),
          ),

          StateWidget(
            index: _currentIndex,
            onIndexSelected : (i) {
              setState(() {
                _currentIndex =  i;
              });
            }  
          ),

          RefreshIndicator(
            onRefresh: () async => BlocProvider.of<ContractorBloc>(context).add(ContractorInitialEvent(user!.codCliente )),
            child: Container(
              padding: EdgeInsets.only( top: size.aspectRatio * 20 ),
              height: size.height * .65 , 
              width: double.infinity,
              child: IndexedStack(
                index: _currentIndex,
                children: [

                  //TODAS
                  BlocBuilder<ContractorBloc, ContractorState>(
                    builder: (context, state) {

                      // if( state is ContractorInitial ){
                      // }

                      if(state is ContractorLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if(state is ContractorLoaded){ 
                        final contractors = state.contractors;
                        return _ListViewWidget(
                          contractors: contractors,
                        );
                      }
          
                      if(state is ContractorError){
                        return Center(
                          child: Text(state.message),
                        );
                      }
          
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
          
                    },
                  ),

                  //COMPLETADO
                  BlocBuilder<ContractorBloc, ContractorState>(
                    builder: (context, state) {
          
                      // if( state is ContractorInitial ){
                      //   BlocProvider.of<ContractorBloc>(context).add(ContractorInitialEvent(user!.codCliente));
                      // }
          
                      if(state is ContractorLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is ContractorLoaded){ 
                        final contractors = state.contractors;
                        return _ListViewWidget(
                          contractors: ContractorUtil.getContractorsByStatus(contractors, true),
                        );
                      }
          
                      if(state is ContractorError){
                        return Center(
                          child: Text(state.message),
                        );
                      }
          
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
          
                    },
                  ),

                  //PENDIENTE
                  BlocBuilder<ContractorBloc, ContractorState>(
                    builder: (context, state) {
          
                      // if( state is ContractorInitial ){
                      //   BlocProvider.of<ContractorBloc>(context).add(ContractorInitialEvent(user!.codCliente));
                      // }
          
                      if(state is ContractorLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is ContractorLoaded){ 
                        final contractors = state.contractors;
                        return _ListViewWidget(
                          contractors: ContractorUtil.getContractorsByStatus(contractors, false),
                        );
                      }
          
                      if(state is ContractorError){
                        return Center(
                          child: Text(state.message),
                        );
                      }
          
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
          
                    },
                  ),

                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

}


class _ListViewWidget extends StatelessWidget {

  final List<ContractorResponse> contractors;
  const _ListViewWidget({required this.contractors});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contractors.length,
      itemBuilder: ( _ , i) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: CardContractor( contractor: contractors[i]),
      ),
    );
  }
}