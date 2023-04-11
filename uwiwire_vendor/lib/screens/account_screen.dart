import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import '../backend/_account_info.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  final AccountInfo _accountInfo = AccountInfo();

  @override
  Widget build(BuildContext context) {
    // _getAccountInfo();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
             Text(
              'My \nProfile',
              textAlign: TextAlign.center,
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(
                  fontSize: 40,
                )

              ), 
              ),
            

            const SizedBox(height: 20),
            
            Container(
              height: height * 0.4,
              color: Color.fromARGB(255, 255, 255, 255),
              child: LayoutBuilder(builder: (context, constraints){ 
                double innerHeight = constraints.maxHeight;
                double innerWidth = constraints.maxWidth;
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      bottom:0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: innerHeight *0.65,
                        width: innerWidth ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color.fromARGB(255, 11, 57, 208),
                        ),
                        child: Column(
                          children:  [
                            const SizedBox(height: 54),

                            Text(_accountInfo.getName(),
                              style:GoogleFonts.lobster(
                textStyle: const TextStyle(
                  fontSize: 40,
                ),
                
                ),
                  ),

                const SizedBox(height: 10),

                Text(_accountInfo.getEmail(),
                              style:GoogleFonts.lobster(
                textStyle: const TextStyle(
                  fontSize: 20,
                ),
                
                ),
                  ),


                          ],
                        ),

                      ), 
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,

                    
                      child: Center(
                        child: Container(
                          width: innerWidth *0.3,
                          //image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvts5aHBstDkR8PigS4RmZkbZy78zpZoSuOw&usqp=CAU'),
                          child:  const CircleAvatar(
                            radius: 70,
                            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQRbiMjUoOxJCAMB9poSO2wLg34m7OxmyaT-A&usqp=CAU',
                            ),

                          
                            

                            
                            ),
                                          
                        ),
                      ),
                    )
                  ] ,
                  );
              }),
            ),

             

            

            
          ],
        ),
      ),
    );
  }
}
