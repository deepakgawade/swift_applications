//
//  Post.swift
//  rightnote
//
//  Created by Deepak Gawade on 11/01/26.
//


struct Post: Codable, Identifiable{
    let id:Int
    let title: String
    let body: String
}
