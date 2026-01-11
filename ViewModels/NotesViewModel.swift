//
//  NotesViewModel.swift
//  rightnote
//
//  Created by Deepak Gawade on 08/01/26.
//

import Foundation
import SwiftData
import Observation


@Observable
final class NotesViewModel {
    var notes: [Note] = []
    private var modelContext: ModelContext
    
    init(modelContext:ModelContext){
        self.modelContext =  modelContext
        fetchNotes()
    }
    
    func fetchNotes(){
        let descriptor = FetchDescriptor<Note>(sortBy:[SortDescriptor(\.timestamp, order:.reverse)])
        
        do{
            notes = try modelContext.fetch(descriptor)
        }catch{
            print("fetch failed")
        }
        
    }
    
    func addNote(title: String, content:String){
        let newNote = Note(title:title, content: content)
        modelContext.insert(newNote)
        fetchNotes()
        
    }
    
    func deleteNote(at offsets:IndexSet){
        for index in offsets{
            modelContext.delete(notes[index])
        }
        
        fetchNotes()
    }
}

