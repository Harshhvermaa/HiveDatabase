import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:keep_files/Model/models.dart';
import 'package:keep_files/Widgets/appbar.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import 'addvideo.dart';

class Homescreen extends StatefulWidget {
  Homescreen({
    Key? key,
  }) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    Box _mybox = Hive.box<notesModel>("keepnotes");
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Appbar(),
          ValueListenableBuilder<Box<notesModel>>(
            valueListenable: Hive.box<notesModel>("keepnotes").listenable(),
            builder: (context, _mybox, _) {
              return Expanded(
                child: 
                StaggeredGridView.countBuilder(
                  itemCount: _mybox.values.length,
                  staggeredTileBuilder: (index) => StaggeredTile.count( 2, index.isOdd ? 1 : 2 ),
                  crossAxisCount: 4, 
                  itemBuilder:  (context, index){
                    notesModel notesmodel = _mybox.getAt(index)!;
                    return Card(
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1.2,
                          color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.4)
                        ),
                        borderRadius:BorderRadius.circular(15.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onLongPress: (){
                            notesmodel.delete();
                          },
                          onTap: (){
                            Get.to(AddVideo( box: _mybox,index: index, ));
                          },
                          child: ListTile(
                              title: Text(
                                notesmodel.Title.toString(),
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              
                              subtitle: Padding(
                                padding: const EdgeInsets.only( top: 10 , ),
                                child: Container(
                                  child: Text(
                                    maxLines: index.isOdd ? 3 : 8,
                                    notesmodel.Description.toString(),
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                              ),
                        ),
                      ),
                    );
                  } 
                  )
                // ListView.builder(
                //     shrinkWrap: true,
                //     itemCount: _mybox.values.length,
                //     itemBuilder: (context, index) {
                //       notesModel notesmodel = _mybox.getAt(index)!;
                //       return ListTile(
                //         title: Text(
                //           notesmodel.Title.toString(),
                //           style: TextStyle(
                //             fontSize: 15,
                //             color: Colors.white.withOpacity(0.6),
                //           ),
                //         ),
                //         subtitle: Text(
                //           notesmodel.Description.toString(),
                //           style: TextStyle(
                //             fontSize: 10,
                //             color: Colors.white.withOpacity(0.6),
                //           ),
                //         ),
                //       );
                //     }),
              );
            },
          ),
        ],
      )),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(AddVideo());
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19)
          ),
          backgroundColor: Colors.grey,
          
          child: Icon(Icons.add , size: 30,),
        ),
      ),
    );
  }
}
