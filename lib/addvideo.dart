import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:keep_files/Model/models.dart';
import 'package:keep_files/Widgets/appbar.dart';

class AddVideo extends StatefulWidget {
  Box<notesModel>? box;
  int? index;
   AddVideo({Key? key , this.box , this.index}) : super(key: key);

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  @override
  Widget build(BuildContext context) {
    var _mybox = Hive.box<notesModel>("keepnotes");
    final _userTitle = TextEditingController( text: widget.box != null ? widget.box!.getAt( widget.index! )!.Title : null );
    final _userdescription = TextEditingController( text: widget.box != null ? widget.box!.getAt( widget.index! )!.Description : null );
 
Future sync() async {
_mybox.add(notesModel(Title: _userTitle.text.toString(), Description: _userdescription.text.toString(), current_Time: DateTime.now()));
Navigator.pop(context);
}


Future Save() async {
  widget.box!.getAt(widget.index!)!.Title = _userTitle.text.toString();
  widget.box!.getAt(widget.index!)!.Description = _userdescription.text.toString();
  widget.box!.getAt(widget.index!)!.save();
Navigator.pop(context);
}

    return 
    WillPopScope(
      onWillPop: () async {
        if( widget.box == null ){
           return await sync();
        }else{
          return await Save();
        }
      },
      child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        actions: [
          Icon(Icons.touch_app, size: 30),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.notifications, size: 30),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.download,
            size: 30,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          // TITLE

          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
              right: 15,
              top: 15,
            ),
            child: TextField(
              onEditingComplete: () {
                setState(() {
                  _mybox.add(notesModel(
                      Title: _userTitle.text.toString(),
                      Description: _userdescription.text.toString(),
                      current_Time: DateTime.now()));
                });
              },
              controller: _userTitle,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 23),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Title",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 23)),
              maxLines: null,
            ),
          ),

          // NOTE

          Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: TextField(
              onEditingComplete: () {
                setState(() {
                  _mybox.add(notesModel(
                      Title: _userTitle.text.toString(),
                      Description: _userdescription.text.toString(),
                      current_Time: DateTime.now()));
                });
              },
              
              controller: _userdescription,
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white, fontSize: 17),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Note",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 17)),
              maxLines: null,
            ),
          ),
          // ElevatedButton(
          //   onPressed: (){
          //      setState(() {
          //          _mybox.add(notesModel(Title: _userTitle.text.toString(), Description: _userdescription.text.toString(), current_Time: DateTime.now()));
          //       });
               
          //   }, 
          //   child: Text("dsfsdfsdf")
          //   )
        ],
      ),
    ), 
      );
  }
}
