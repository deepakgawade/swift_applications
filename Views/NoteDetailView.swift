//
//  NoteDetailView.swift
//  rightnote
//
//  Created by Deepak Gawade on 11/01/26.
//
import SwiftUI
import SwiftData

struct NoteDetailView: View{
    
    @Bindable var note: Note
    
    var body: some View {
        Form {
            Section(header: Text("title ")){
                TextField("Title", text:$note.title)
            }
            
            Section(header: Text("content")){
                TextEditor(text:$note.content).frame(minHeight: 200)
            }
        }
        .navigationTitle("Edit Note")
        .navigationBarTitleDisplayMode(.inline)
    }
}
