import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/presentation/blocs/admin/request/request_bloc.dart';
import 'package:smart/presentation/theme/theme.dart';
import 'package:smart/presentation/widgets/widgets.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/core/helpers/get_list_request_by_status.dart';

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
      BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
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
                onTap: () => showSearch(context: context, delegate: RequestSearchDelegate(BlocProvider.of<RequestBloc>(context))),
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
            onRefresh: () async => BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo)),
            child: Container(
              padding: EdgeInsets.only(top: size.aspectRatio * 20),
              height: size.height * .65,
              width: double.infinity,
              child: IndexedStack(
                index: _currentIndex,
                children: [

                  //TODAS
                  BlocBuilder<RequestBloc, RequestState>(
                    builder: (context, state) {

                      if(state is RequestLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if(state is RequestLoaded){ 
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: requests.length,
                          itemBuilder: (_, i) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CardRequest(request: requests[i]),
                          ),
                        );
                      }

                      if(state is RequestError){
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
                  BlocBuilder<RequestBloc, RequestState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is RequestLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is RequestLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsByStatus(requests, "AUTORIZADO").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsByStatus(requests, "AUTORIZADO");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is RequestError){
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
                  BlocBuilder<RequestBloc, RequestState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is RequestLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is RequestLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsByStatus(requests, "AUTO. PARCIAL").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsByStatus(requests, "AUTO. PARCIAL");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is RequestError){
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
                  BlocBuilder<RequestBloc, RequestState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is RequestLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is RequestLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsByStatus(requests, "OBSERVADO").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsByStatus(requests, "OBSERVADO");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is RequestError){
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
                  BlocBuilder<RequestBloc, RequestState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is RequestLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is RequestLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsByStatus(requests, "PENDIENTE").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsByStatus(requests, "PENDIENTE");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is RequestError){
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
                  BlocBuilder<RequestBloc, RequestState>(
                    builder: (context, state) {

                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }

                      if(state is RequestLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if(state is RequestLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsByStatus(requests, "COMPLETADO").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsByStatus(requests, "COMPLETADO");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }

                      if(state is RequestError){
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
                  BlocBuilder<RequestBloc, RequestState>(
                    builder: (context, state) {
          
                      // if( state is RequestInitial ){
                      //   final user = BlocProvider.of<AuthBloc>(context).user;
                      //   BlocProvider.of<RequestBloc>(context).add(InitialEvent(user!.codCliente, user.codigo));
                      // }
          
                      if(state is RequestLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
          
                      if(state is RequestLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsByStatus(requests, "VENCIDO").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsByStatus(requests, "VENCIDO");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
          
                      if(state is RequestError){
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
                  BlocBuilder<RequestBloc, RequestState>(
                    builder: (context, state) {

                      if(state is RequestLoading){
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if(state is RequestLoaded){
                        final requests = state.requests;
                        return ListView.builder(
                          itemCount: RequestUtils.getRequestsByStatus(requests, "ENVIADO").length,
                          itemBuilder: (_, i){
                            final requestsAuthority = RequestUtils.getRequestsByStatus(requests, "ENVIADO");
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CardRequest(request: requestsAuthority[i]),
                            );
                          }
                        );
                      }
 
                      if(state is RequestError){
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
