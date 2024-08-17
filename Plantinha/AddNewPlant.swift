//
//  AddNewPlant.swift
//  Plantinha
//
//  Created by Monique Ferrarini on 08/08/24.
//

import SwiftUI
import PhotosUI

struct AddNewPlant: View {
	
	@Environment(\.dismiss) var dismiss
	
	@ObservedObject var myList: PlantsList
	
	@State var name: String = ""
	@State var waterFrequency: Int = 0
	@State var lastTimeWatered  = Date.now
	@State var fertilizerType: String = ""
	@State var fertilizerFrequency: Int = 0
	@State var lastTimeFertilized = Date.now
	@State var notes: String = ""
	@State var image: UIImage?
	@State var photosPickerItem: PhotosPickerItem?
	
	var body: some View {
		
		NavigationStack {
			
			
			VStack{
				
				Text("Name:")
					.padding(.leading)
					.frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment: .leading)
				
				HStack {
					
					TextField("Name of the plant", text: $name)
						.border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
						.frame(width: 210)
						.padding()
						.padding(.trailing, 30)
					
					
					PhotosPicker(selection: $photosPickerItem, matching: .images) {
						if let image = image {
							Image(uiImage: image)
								.resizable()
								.scaledToFill()
								.frame(width: 100, height: 100)
								.clipShape(Circle())
								.overlay(
									Circle()
										.stroke(Color.myColorGreen, lineWidth: 2)
								)
								.padding()
							
						} else {
							Image(systemName: "plus")
								.foregroundStyle(Color.myColorGreen)
								.background(
									Circle()
										.fill(Color.myColorGreen.opacity(0.3))
										.stroke(Color.myColorGreen, lineWidth: 2)
										.frame(width: 100 ,height: 100)
								)
								.padding()
						}
						
					}
							.onChange(of: photosPickerItem){ _, _ in
								Task {
									if let photosPickerItem,
									   let data = try? await photosPickerItem.loadTransferable(type: Data.self) {
										if let imagem = UIImage(data: data){
											image = imagem
										}
									}
									photosPickerItem = nil
								}
							}
					
					
					
					
				}
				.frame(maxWidth: .infinity, alignment: .leading)
				
			}
			
			VStack {
				HStack {
					Text("Water Frequency:")
						.padding()
					Picker("Select a number", selection: $waterFrequency) {
						ForEach(0..<31) {
							Text("\($0)")
						}
					} .labelsHidden()
					
					Text("days")
					
				} . frame(maxWidth: .infinity, alignment: .leading)
				
				
				HStack {
					Text("Last time you watered:")
						.padding()
					DatePicker("Last Time", selection: $lastTimeWatered, in: ...Date.now, displayedComponents: .date)
					//				Text(lastTimeWatered, style: .date)
				} .labelsHidden()
					.frame(maxWidth: .infinity, alignment: .leading)
				
			} .background(
				RoundedRectangle(cornerRadius: 25.0)
					.stroke(lineWidth: 1)
			)
			.padding()
			.padding(.top)
			
			
			
			HStack{
				
				
				Text("Fertilizer:")
				
				Spacer()
				
				Button(action: {
					
				}
					   , label: {
					Image(systemName: "plus")
						.padding(.horizontal)
				})
				
			} .padding()
			
				.toolbar {
					ToolbarItem(placement: .topBarTrailing) {
						Button("Save") {
							let newplant = Plant(name: name, notes: notes, waterFrequency: waterFrequency, lastTimeWater: lastTimeWatered, fertilizerType: fertilizerType, fertilizerFrequency: fertilizerFrequency, image: image!, lastTimeFertilizer: lastTimeFertilized)
							
							myList.theList.append(newplant)
							print(newplant)
							dismiss()
						}
					}
					
					
				}
			
			
			//			VStack{
			//
			//				Text("Looks like you dont have any fertilizer yet. Click on + to add")
			//					.padding()
			//					.background(
			//					RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
			//						.stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
			//
			//					).padding(.horizontal)
			//
			//			}
			
			VStack{
				
				
				HStack {
					Text("Type:")
						.padding()
					TextField("Fertilizer Type", text: $fertilizerType)
						.border(Color.black)
						.padding(.trailing)
				}
				
				HStack {
					Text("Fertilizer Frequency:")
						.padding()
					Picker("Select a number", selection: $fertilizerFrequency) {
						ForEach(0..<61) {
							Text("\($0)")
						}
					} .labelsHidden()
					
					Text("days")
					
				} . frame(maxWidth: .infinity, alignment: .leading)
				
				HStack {
					Text("Last time you use fertilizer:")
						.padding()
					DatePicker("Last Time", selection: $lastTimeFertilized, displayedComponents: .date)
					//					Text(lastTimeFertilized, style: .date)
					
				} .labelsHidden()
					.frame(maxWidth: .infinity, alignment: .leading)
				
				
				
				
			} .background(
				RoundedRectangle(cornerRadius: 25.0)
					.stroke(lineWidth: 1)
			)
			.padding()
			
			VStack{
				
				Text("Notes:")
					.frame(maxWidth: .infinity, alignment: .leading)
					.padding(.horizontal)
					.padding(.top)
				
				TextEditor(text: $notes)
					.border(Color.black)
					.padding(.horizontal)
					.padding(.bottom)
				
				
			}.background(
				RoundedRectangle(cornerRadius: 25.0)
					.stroke(lineWidth: 1)
			)
			.padding()
			
			
			
		}
	}
	
}
extension View {
	func printOutput(_ value: Any) -> Self {
		print(value)
		return self
	}
}

#Preview {
	AddNewPlant(myList: PlantsList())
}
