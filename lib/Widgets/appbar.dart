import 'package:flutter/material.dart';

class Appbar extends StatefulWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  State<Appbar> createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.symmetric( horizontal: 20,vertical: 16 ),
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white
                  )
                ],
                borderRadius: BorderRadius.circular(15.0),
                color: Color.fromARGB(255, 0, 0, 0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.menu , color: Colors.white, ),
                      SizedBox(width: 10,),
                      Text(
                        "Search your notes",
                        style:
                            TextStyle(
                            fontSize: 20, 
                            color: Colors.white.withOpacity(0.6),
                            
                            ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.grading_outlined,color: Colors.white, ),
                      SizedBox(width: 10,),
                      Icon(Icons.person_outline_rounded,color: Colors.white, ),
                    ],
                  )
                ],
              ),
            ),
          );
  }
}