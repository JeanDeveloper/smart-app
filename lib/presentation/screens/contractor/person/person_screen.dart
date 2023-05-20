import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:smart/presentation/blocs/contractor/person/person_bloc.dart';
import 'package:smart/presentation/screens/contractor/person/widgets/tile_person.dart';
import 'package:smart/presentation/blocs/contractor/create_person/create_person_bloc.dart';
import 'package:smart/presentation/screens/contractor/create_person/create_person_screen.dart';

class PersonScreen extends StatefulWidget {
  const PersonScreen({super.key});

  @override
  State<PersonScreen> createState() => _PersonScreenState();
}

class _PersonScreenState extends State<PersonScreen> {

  @override
  void initState() {
    final user = BlocProvider.of<AuthBloc>(context).user;
    BlocProvider.of<PersonBloc>(context).add( PersonInitialEvent( user!.codCliente, user.codEmpresa ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final user = BlocProvider.of<AuthBloc>(context).user;

    final createPersonBloc = BlocProvider.of<CreatePersonBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Personal"),
        centerTitle: true,
        elevation: .5,
      ),

      body: BlocBuilder<PersonBloc, PersonState>(

      builder: (context, state) {

        if( state is PersonLoading) const Center(child: CircularProgressIndicator());
        if( state is PersonError  ) Center(child: Text(state.message));

        if( state is PersonLoaded ){
          final persons = state.persons;
          return RefreshIndicator(
            onRefresh: () async{
              BlocProvider.of<PersonBloc>(context).add( PersonInitialEvent( user!.codCliente, user.codEmpresa ));
            },
            child: SizedBox.expand(
              child: ListView.builder(
                itemCount: persons.length,
                itemBuilder: ( _ , i) => TilePerson(person: persons[i]),
                // itemBuilder: (context, index) =>  Container(child: Text("${index}")),
              ) 
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());

      },

    ),

      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        heroTag: 'create-personal-button',
        onPressed: () => Navigator.push(context, MaterialPageRoute( builder: (context) => CreatePersonScreen(createPersonBloc: createPersonBloc))),
        child: const Icon(Icons.add),
      ),
    );

  }
}