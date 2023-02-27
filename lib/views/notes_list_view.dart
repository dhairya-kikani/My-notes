import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mynotes/services/crud/notes_service.dart';


typedef DeleNoteCallback = void Function(DatabaseNote note);

class NotesListView extends StatelessWidget {

final List<DatabaseNote> notes;
final DeleNoteCallback onDeleteNote;

const NotesListView
({super.key, 
required this.notes, 
required this.onDeleteNote});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                        itemCount: notes.length,
                        itemBuilder: (context, index) {
                          final note = notes[index];
                          return ListTile(
                          title: Text(
                          note.text,
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          ),
                          trailing: IconButton(
                            onPressed: ()async {
                            final shouldDelete = await showDeleteDialog(context);
                            if(shouldDelete) {
                              onDeleteNote(note);
                            }
                            },
                            icon: const Icon(Icons.delete),
                          ),
                          );
                        },
                      );
  }
}