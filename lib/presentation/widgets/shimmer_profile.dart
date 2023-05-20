import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerProfile extends StatelessWidget {
  const ShimmerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [
        Expanded(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, 
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child:Shimmer.fromColors(
                    baseColor: Colors.red,
                    highlightColor: Colors.yellow,
                    child:const Text(
                      'Shimmer',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),
                  ) ,
                ),
              ),

            ],
          ),
        )
      
      
      
      ],
    );
  }
}