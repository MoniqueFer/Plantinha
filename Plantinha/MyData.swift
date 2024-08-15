//
//  MyData.swift
//  Plantinha
//
//  Created by Monique Ferrarini on 07/08/24.
//

import Foundation
import SwiftData
import UIKit
import SwiftUI


//this is where i create the database.. Each @model and then a class is a Entity. So here I have an user entity with a name and Id. I need to see how to store images later.

@Model
class User: Identifiable {
    
    var id: String
    var name: String
//    var image : ?? user photo - assign that later
    
    init(name: String) {
        self.id = UUID().uuidString
        self.name = name
    }
}
