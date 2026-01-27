//
//  PostsView.swift
//  rightnote
//
//  Created by Deepak Gawade on 11/01/26.
//

import SwiftUI
struct PostsView: View{
    @State private var viewModel = PostsViewModel()
    
    var body: some View{
        NavigationStack{
            Group{
                if viewModel.isLoading{
                    ProgressView("Fetching Data...")
                }else if viewModel.errorMessage != nil{
                    VStack(spacing:12){
                        ContentUnavailableView("Error", systemImage: "exclamationmark")
                        Button(action:{    Task{
                            await viewModel.fetchPosts()
                        }}){
                        
                          
                                Label("Reload", systemImage:"arrow.clockwise")
                                
                            
                        }.buttonStyle(.borderedProminent)
                    }
                    
            
                    
                    
                }else{
                    List(viewModel.posts){
                        post in VStack(alignment: .leading){
                            Text(post.title).font(.headline)
                            Text(post.body).font(.subheadline).foregroundStyle(.secondary)
                        }
                    }
                }
            }
            
        }.navigationTitle("open API Posts")
            .task {
                await viewModel.fetchPosts()
            }
    }
    
}
