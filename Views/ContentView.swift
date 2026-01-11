//
//  ContentView.swift
//  rightnote
//
//  Created by Deepak Gawade on 07/01/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var viewModel: NotesViewModel
    
    init(modelContext: ModelContext){
        _viewModel = State(initialValue: NotesViewModel(modelContext: modelContext))
    }
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.notes) { note in
                    NavigationLink(destination:NoteDetailView(note:note)){
                        VStack {
                            Text("Item at \(note.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
    //                        Text(note.title,).font(.headline)
    //                        Text(note.content,).font(.subheadline)
                        }
                    }
                
                }
                .onDelete(perform: viewModel.deleteNote)
            }.navigationTitle("Notes")
#if os(macOS)
            .navigationSplitViewColumnWidth(min: 180, ideal: 200)
#endif
            .toolbar {
#if os(iOS)
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
#endif
                ToolbarItem {
                    Button(action:{ viewModel.addNote(title: "New Note", content: "Add content here")})
                        {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        }
    }

//    private func addItem() {
//        withAnimation {
//            let newItem = Item(timestamp: Date())
//            modelContext.insert(newItem)
//        }
//    }

//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(items[index])
//            }
//        }
//    }
}

//#Preview {
//    ContentView(modelContext: <#T##ModelContext#>)
//        .modelContainer(for: Item.self, inMemory: true)
//}
