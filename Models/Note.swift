//
//  Note.swift
//  rightnote
//
//  Created by Deepak Gawade on 07/01/26.
//

import Foundation
import SwiftData

@Model
final class Note {
    var id:UUID
    var title: String
    var content: String
    var timestamp: Date
    
    init(title: String = "", content: String = "" ){
        self.id = UUID()
        self.title = title
        self.content = content
        self.timestamp = Date()
    }
}

