import 'package:dartz/dartz.dart';
import 'package:smart/core/errors/exceptions.dart';
import 'package:smart/core/errors/failure.dart';
import 'package:smart/core/global/constants.dart';
import 'package:smart/data/datasources/message_datasource.dart';
import 'package:smart/domain/repositories/imessage_repository.dart';
import 'package:smart/domain/request/register_msg_wsp.dart';
import 'package:smart/domain/response/api_wassenger_response.dart';
import 'package:smart/domain/response/message_receiver_response.dart';

class MessageRepository extends IMessageRepository{

  final IMessageDataSource messageDataSource;
  MessageRepository(this.messageDataSource);

  @override
  Future<Either<Failure, int>> sendMsgWsp(String codeEncrypt, String documentName, int messageType, String createdBy) async {

    try {
      final List<MsgReceiverResponse> resp = [];
      String message = "";
      final receiverResp = await messageDataSource.getInforeceiversMsg(codeEncrypt);
      (messageType == 1 || messageType == 2)  ? resp.add(receiverResp.first) : resp.addAll(receiverResp) ;

      for (var contact in resp) {

        if( messageType == 1 ){
          message = 
          '''📢 *Aviso SMART - ${contact.codCabecera}*❌
          ¡Hola *${contact.usuarioContratista}*! 😟… ‼️
          La solicitud *${contact.codCabecera}* de ${contact.empresa} para la sede *${contact.sede} - ${contact.subsede}* ha sido OBSERVADA por la empresa *${contact.cliente}*.
          El documento observado es:
          📋*$documentName*
          Puedes subsanar las observaciones de la solicitud desde aquí 🤗 👇:
          📌 *www.gruposolmar.com.pe/smart*''';
        }else if( messageType == 2 ){
          message = 
          '''📢 *Aviso SMART - ${contact.codCabecera}*❌
          ¡Hola *${contact.usuarioContratista}*! 😟… ‼️
          La solicitud *${contact.codCabecera}* de ${contact.empresa} para la sede *${contact.sede} - ${contact.subsede}* ha sido OBSERVADA por la empresa *${contact.cliente}*.
          📋 Solicitados: *${contact.solicitados}*
          🏷️ Completados: *${contact.completados}*
          ✅ Autorizados: *${contact.autorizados}*
          🔍 Observados: *${contact.observados}*
          🕗 Pendientes: *${contact.incompletos}*

          Puedes subsanar las observaciones de la solicitud desde aquí 🤗 👇:
          📌 *www.gruposolmar.com.pe/smart*''';
        }else if ( messageType == 3 ){

          message = 
          '''📢 *Aviso SMART - ${contact.codCabecera}*❌
          ¡Hola *${contact.nombreAutorizante}*! 😟… ‼️
          *${contact.empresa}*  ha registrado la solicitud  *${contact.codCabecera}* para la sede *${contact.sede} - ${contact.subsede}*..
          📋 Solicitados: *${contact.solicitados}*
          🏷️ Completados: *${contact.completados}*
          ✅ Autorizados: *${contact.autorizados}*
          🔍 Observados: *${contact.observados}*
          🕗 Pendientes: *${contact.incompletos}*

          Puedes subsanar las observaciones de la solicitud desde aquí 🤗 👇:
          📌 *www.gruposolmar.com.pe/smart*''';

        }

        final wassengerResponse = await messageDataSource.sendMsgWsp( 
          (messageType == 1 || messageType  == 2) ? contact.fonoContratista  : contact.fonoAutorizante , 
          message
        );

        if(wassengerResponse is ApiWassengerSucessResponse){
          final request = RegisterMsgWspRequest(
            codEnvio: (messageType == 1 || messageType == 2) ?Constants.alertType[3]  : Constants.alertType[4],  
            idApi: wassengerResponse.id, 
            telefono: wassengerResponse.phone, 
            codigoPers: (messageType == 1 || messageType == 2)  ?"" : contact.codAutorizante.toString(), 
            dni: (messageType == 1 || messageType == 2) ? "" : contact.dniAutorizante, 
            nombre: (messageType == 1 || messageType == 2) ? contact.contratista :  contact.autorizante, 
            mensaje: message, 
            idArchivo: "TEXTO SIN IMAGEN", 
            error: 'MESSAGE SEND', 
            creadoPor: createdBy,
          );
          final saveResponse = await messageDataSource.registerMsgWsp(request);
          
        }

      }
      return const Right(1);

    }on AuthException catch(auth){
      return Left(AuthFailure(message: auth.message ));
    } on ServerException {
      return Left(ServerFailure(message: "Ha ocurrido un problema en el servidor"));
    } 

  }
}