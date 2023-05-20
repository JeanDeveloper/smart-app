import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart/core/helpers/get_image.dart';

class ImageCardWidget extends StatelessWidget {

  const ImageCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ClipRRect(

      borderRadius:  BorderRadius.circular(25),

      child: SizedBox(

        width: size.width*0.5,
        height: size.height*0.3,

        child: Stack(

          children: [

            //FOTO
            SizedBox(
              width: double.infinity,
              height: size.height * .2,
              child: FutureBuilder(
                future: getImage( null) ,
                builder: (context, AsyncSnapshot<Widget> snapshot) {
                  if(!snapshot.hasData) return const CircularProgressIndicator();
                  return snapshot.data!;
                },
              ),
              // child: ImageCreatedWidget(urlimage:(personalProvider.foto==null)? null : personalProvider.foto!.path ),
            ), 



            // //CAMARA
            // Positioned(

            //   top: size.height*0.001,
            //   right: size.width*0.06,

            //   child: IconButton(

            //     icon:Icon(Icons.camera_alt, color: Colors.white, size: size.width*0.15),

            //     onPressed: () async {  

            //       final picker = ImagePicker();

            //       final pickedFile = await picker.pickImage(
            //         source: ImageSource.camera,
            //         imageQuality: 25,
            //       );

            //       if ( pickedFile == null )return;

            //       // personalProvider.updateImage(pickedFile.path);

            //       // // ignore: use_build_context_synchronously
            //       // Navigator.pop(context);

            //       // await NDialog(

            //       //   dialogStyle: DialogStyle(titleDivider: true, backgroundColor: Colors.white),
            //       //   title:  const Text("Información",  style: TextStyle(color: Colors.black)),
            //       //   content:  const Text("Que accion desea hacer?", style: TextStyle(color: Colors.black)),
                    
            //       //   actions: <Widget>[

            //       //     TextButton(

            //       //       child: const Text("Ir a Camara"),

            //       //       onPressed: ()async{

            //       //         final pickedFile = await picker.pickImage(

            //       //           source: ImageSource.camera,
            //       //           imageQuality: 100,

            //       //         );

            //       //         if ( pickedFile == null ){

            //       //           // ignore: use_build_context_synchronously
            //       //           Navigator.pop(context);
            //       //           return;

            //       //         }
    
            //       //         personalProvider.updateImage(pickedFile.path);

            //       //         // ignore: use_build_context_synchronously
            //       //         Navigator.pop(context);
    
            //       //       }
    
            //       //     ),

            //       //     TextButton(
    
            //       //       child: const Text("Abrir Galeria"),
    
            //       //       onPressed: ()async{
    
            //       //         final pickedFile = await picker.pickImage(
            //       //           source: ImageSource.gallery,
            //       //           imageQuality: 100,
            //       //         );
    
            //       //         if (pickedFile == null){
            //       //           // ignore: use_build_context_synchronously
            //       //           Navigator.pop(context);
            //       //           return;
            //       //         }

            //       //         personalProvider.updateImage(pickedFile.path);
    
            //       //         // ignore: use_build_context_synchronously
            //       //         Navigator.pop(context);
    
            //       //       }
    
            //       //     ),

            //       //   ],

            //       // ).show(context);

            //     },

            //   ),
            // )
          
          
          
          ],
        ),
      ),
    );
  }
}
