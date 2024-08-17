//
//  MyData.swift
//  Plantinha
//
//  Created by Monique Ferrarini on 07/08/24.
//

import Foundation
import SwiftData
import UIKit


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



class Plant: Identifiable {
	
	var image: UIImage?
	var id = UUID()
	var name: String
	var notes: String
	var waterFrequency: Int
	var lastTimeWater: Date
	var fertilizerType: String
	var fertilizerFrequency: Int
	var lastTimeFertilizer: Date
	
	init(name: String, notes: String, waterFrequency: Int, lastTimeWater: Date, fertilizerType: String, fertilizerFrequency: Int, image: UIImage, lastTimeFertilizer: Date) {
		self.name = name
		self.notes = notes
		self.waterFrequency = waterFrequency
		self.lastTimeWater = lastTimeWater
		self.fertilizerType = fertilizerType
		self.fertilizerFrequency = fertilizerFrequency
		self.image = image
		self.lastTimeFertilizer = lastTimeFertilizer
	}
}

class PlantsList: ObservableObject {
	@Published var theList = [Plant]()
}
