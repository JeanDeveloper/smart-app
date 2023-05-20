import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart/core/helpers/alert_dialog.dart';
import 'package:smart/core/utils/string.dart';
import 'package:smart/domain/entities/credential.dart';
import 'package:smart/domain/response/contractor_response.dart';
import 'package:smart/presentation/blocs/admin/credential/credential_bloc.dart';
import 'package:smart/presentation/blocs/auth/auth_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class TilePersonCredential extends StatelessWidget {

  final Credential credential;
  final ContractorResponse contractor;
  const TilePersonCredential({
    super.key, 
    required this.credential, 
    required this.contractor
  });

  @override
  Widget build(BuildContext context) {

    final size     = MediaQuery.of(context).size;
    final user     = BlocProvider.of<AuthBloc>(context).user;
    const duration = Duration(seconds: 1);

    return InkWell(
      onLongPress: () => showAlertDialog(
        context, 
        (credential.habilitado) ? "¿Desea desactivar la credencial?" : "¿Desea activar la credencial?",
        (credential.habilitado)
          ? () {
            BlocProvider.of<CredentialBloc>(context).add(EnabledCredentialEvent( 2, user!.codCliente, contractor.codigoEmpresa?? 0 , credential.codigo, credential.usuario, user.userName));
            Navigator.pop(context);
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                backgroundColor: Colors.amber,
                message: "Credencial desactivado exitosamente",
              ),
              animationDuration: duration,
              displayDuration: duration,
              reverseAnimationDuration: duration,
            );
          }

          : () {
            BlocProvider.of<CredentialBloc>(context).add(EnabledCredentialEvent( 1, user!.codCliente, contractor.codigoEmpresa?? 0 , credential.codigo, credential.usuario, user.userName));
            Navigator.pop(context);
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                backgroundColor: Colors.amber,
                message: "Credencial activado exitosamente",
              ),
              animationDuration: duration,
              displayDuration: duration,
              reverseAnimationDuration: duration,
            );
          },

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Container(
          width: size.width,
          height: size.height *  .1,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,  
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, 1),
                spreadRadius: 1
              )
            ]
          ),
          child: Row(
            children: [
              Container(
                height: size.height * .3,
                width: size.width * .04,
                color: ( credential.habilitado ) ? Colors.green : Colors.red,
              ),
              Expanded(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:  [
                      Text(StringUtils.converString(credential.fullname), style: Theme.of(context).textTheme.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                      Text(credential.telefono,  style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ],
                  ),
    
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox( width: size.width * .65, child: Text(credential.email  , style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis)),
                          Text(credential.fechaCreacion.toString().substring(0,11), style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis,),
                        ],
                      ),
    
                      Text(credential.usuario, style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis,),
    
                    ],
                  ),
    
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}