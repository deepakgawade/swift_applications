//
//  PostViewModel.swift
//  rightnote
//
//  Created by Deepak Gawade on 11/01/26.
//

import Foundation

@Observable
@MainActor
class PostsViewModel{
    var posts: [Post] = []
    
    var isLoading  = false
    var errorMessage: String?
    
    func fetchPosts()async{
        isLoading = false
        
        errorMessage = nil
        
        guard let url = URL(string:"https://jsonplaceholder.typicode.com/posts/") else {return}
        
        do {
            let ( data, _) = try await URLSession.shared.data(from: url)
            self.posts = try JSONDecoder().decode([Post].self, from: data)
            
        }catch{
            self.errorMessage = "Failed to load data: \(error.localizedDescription)"
        }
        
        isLoading=false
    }
    
    
}


