import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/helpers/get_list_request_by_status.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/blocs/contractor/solicitud/solicitud_bloc.dart';
import 'package:smart/presentation/screens/contractor/request/widgets/widget.dart';
import 'package:smart/presentation/theme/theme.dart';
import 'package:smart/presentation/widgets/solicitud_search_delegate.dart';

class BodyContainer extends StatefulWidget {
  const BodyContainer({super.key});

  @override
  State<BodyContainer> createState() => _BodyContainerState();
}

class _BodyContainerState extends State<BodyContainer> {
  int _currentIndex = 0;

  @override
  void initState() {

    WidgetsBinding.instance.addPostFrameCallback((_){
      final user = BlocProvider.of<AuthBloc>(context).user;
      BlocProvider.of<SolicitudBloc>(context).add(InitialEvent(user!.codEmpresa, user.codCliente));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final user = BlocProvider.of<AuthBloc>(context).user;

    return SingleChildScrollView(
      child: Column(
        children: [

          //buscador
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
                onTap: () => showSearch(context: context, delegate: SolicitudSearchDelegate(BlocProvider.of<SolicitudBloc>(context))),
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

          //cajas de filtraciones
          StateContainer(
            index: _currentIndex,
            onIndexSelected: (i) {
              setState(() {
                _currentIndex = i;
              });
            },
          ),

          //lista de solicitudes
          RefreshIndicator(
            color: Colors.transparent,
            backgroundColor: Colors.transparent,
            onRefresh: () async => BlocProvider.of<SolicitudBloc>(context).add(InitialEvent(user!.codEmpresa, user.codCliente)),
            child: Container(
              padding: EdgeInsets.only(top: size.aspectRatio * 20),
              height: size.height * .65,
              width: double.infinity,
              child: IndexedStack(
                index: _currentIndex,
                children: [

                  //TODAS
                  BlocBuilder<SolicitudBloc, SolicitudState>(
                    builder: (context, state) {

                      // if( state is RequestInitial ) {
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }  

                      if(state is SolicitudLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if(state is SolicitudLoaded){ 
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: requests.length,
                          itemBuilder: (_, i) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CardRequest(request: requests[i]),
                          ),
                        );
                      }

                      if(state is SolicitudError){
                        return Center(
                          child: Text(state.message),
                        );
                      }

                      return const Center(
                        child: CircularProgressIndicator(),
                      );

                    },
                  ),

                  //AUTORIZADO
                  BlocBuilder<SolicitudBloc, SolicitudState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is SolicitudLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is SolicitudLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsContractorByStatus(requests, "AUTORIZADO").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsContractorByStatus(requests, "AUTORIZADO");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is SolicitudError){
                        return Center(
                          child: Text(state.message),
                        );
                      }
          
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
          
                    },
                  ),

                  //AUTO. PARCIAL
                  BlocBuilder<SolicitudBloc, SolicitudState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is SolicitudLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is SolicitudLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsContractorByStatus(requests, "AUTO. PARCIAL").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsContractorByStatus(requests, "AUTO. PARCIAL");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is SolicitudError){
                        return Center(
                          child: Text(state.message),
                        );
                      }
          
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
          
                    },
                  ),

                  //OBSERVADO
                  BlocBuilder<SolicitudBloc, SolicitudState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is SolicitudLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is SolicitudLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsContractorByStatus(requests, "OBSERVADO").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsContractorByStatus(requests, "OBSERVADO");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is SolicitudError){
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
                  BlocBuilder<SolicitudBloc, SolicitudState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is SolicitudLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is SolicitudLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsContractorByStatus(requests, "PENDIENTE").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsContractorByStatus(requests, "PENDIENTE");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is SolicitudError){
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
                  BlocBuilder<SolicitudBloc, SolicitudState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is SolicitudLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is SolicitudLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsContractorByStatus(requests, "COMPLETADO").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsContractorByStatus(requests, "COMPLETADO");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is SolicitudError){
                        return Center(
                          child: Text(state.message),
                        );
                      }
          
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
          
                    },
                  ),

                  //VENCIDO
                  BlocBuilder<SolicitudBloc, SolicitudState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is SolicitudLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is SolicitudLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsContractorByStatus(requests, "VENCIDO").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsContractorByStatus(requests, "VENCIDO");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is SolicitudError){
                        return Center(
                          child: Text(state.message),
                        );
                      }
          
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
          
                    },
                  ),

                  //ENVIADO
                  BlocBuilder<SolicitudBloc, SolicitudState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is SolicitudLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is SolicitudLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsContractorByStatus(requests, "ENVIADO").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsContractorByStatus(requests, "ENVIADO");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is SolicitudError){
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
