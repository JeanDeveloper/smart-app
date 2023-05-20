import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


Future<Widget> getImage( String? urlImage ) async {

  if( urlImage == null )return const Image(image: AssetImage("assets/png/avatar_no_found.png"));

  if( urlImage.startsWith( ' http' ) ) {
    final uri  = Uri.parse(urlImage);
    final resp =  await http.get(uri);
    if( resp.statusCode == 200 )return Image( image: NetworkImage(urlImage),fit: BoxFit.fill);
    return const Image(image: AssetImage('assets/png/avatar_no_found.png'));
  }else{
    return Image.file(
      File( urlImage ),
      fit: BoxFit.fill,
    );
  }
}