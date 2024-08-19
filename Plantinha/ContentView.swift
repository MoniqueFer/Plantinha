//
//  ContentView.swift
//  Plantinha
//
//  Created by Monique Ferrarini on 07/08/24.
//

import SwiftUI
import SwiftData


struct ContentView: View {
	@State var myRows = Array(repeating: GridItem(.flexible()), count: 1)
	
	//creating a instance of the class that holds the list insite the view to act like a "subscriber" to any changes in the list and be notified of it.
	@ObservedObject var myList = PlantsList()
	
	//asking swift for array of data
	@Query var plants : [Plant]
	
	//A ModelContext provides a connection between the view and the model container so that you can fetch, insert, and delete items in the container. The .modelContainer modifier you added to ContentView inserts a modelContext into the SwiftUI environment, and that modelContext is accessible to all views under the container.
	@Environment (\.modelContext) private var context
	
	enum WaterPicker: String, CaseIterable, Identifiable{
		
		case today
		case tomorrow
		case week
		
		var id: String {self.rawValue}
	}
	
	@State var myday = WaterPicker.today
	
	
	var body: some View {
		NavigationStack {
			ScrollView {
				
				VStack {
					
					HStack{
						Text("Welcome to your garden, Monique!")
							.font(.title)
							.padding(.leading)
						
						Spacer()
						
						Circle()
							.frame(width: 80, height: 80)
							.padding(20)
							.background(
								Circle()
									.fill(Color.myColorPink)
									.padding()
							)
					}
					
					.padding()
					
					//plants grid view
					
					
					ScrollView (.horizontal) {
						
						HStack {
							
							NavigationLink {
								AddNewPlant(modelContext: context, myList: myList)
							} label: {
								Text("+")
									.font(.title2)
									.padding()
									.foregroundStyle(.black)
									.frame(height: 100)
									.background(
										RoundedRectangle(cornerRadius: 20)
											.fill(Color.myColorYellow)
										
									)
							 .padding(.leading)
							}

							LazyHGrid(rows: myRows, content: {
								
								ForEach(plants) { plantinhaItem in
									NavigationLink(destination:
													PlantInfo(plantinhaItem: plantinhaItem)) {
										
										HStack{
											VStack{
												Text("\(plantinhaItem.name)")
													.font(.title2)
													.padding()
													.foregroundStyle(.black)
													.frame(height: 100)
													.background(
														RoundedRectangle(cornerRadius: 20)
															.fill(Color.myColorYellow)
														
													)
											} .padding(.leading)
											
											
										}
										
										
										
									}
									//end nav link
								}
								//end Foreach
							})
									  //end lazy HGrid
						}
						//end horizontal scrollview
							
					}
						
					
					Text("Watering:")
						.font(.title)
						.frame(maxWidth: .infinity, alignment: .leading)
						.padding()
					
					//trying to put picker together
					
					Picker("Water Picker", selection: $myday){
						ForEach(WaterPicker.allCases) { index in
							Text(index.rawValue.capitalized)
								.tag(index)
							//end foreach
						}
						//end picker
					}
					.pickerStyle(SegmentedPickerStyle())
					.background(
						Color.myColorYellow
					)
					.padding(.horizontal)
					// end of trying to put picker together
					
					
					// ============ DEBUGGING - SEEING WHATS BEING SAVED
//					Button("Print Plants") {
//									for plant in plants {
//										print("Plant Name: \(plant.name)")
//										print("Notes: \(plant.notes)")
//										print("Water Frequency: \(plant.waterFrequency) days")
//										print("Last Time Watered: \(plant.lastTimeWater)")
//										print("Fertilizer Type: \(plant.fertilizerType)")
//										print("Fertilizer Frequency: \(plant.fertilizerFrequency) days")
//										print("Last Time Fertilized: \(plant.lastTimeFertilizer)")
//										print("----------")
//									}
//								}
							// ========= END DEBUG
					
									
					
					//end First VStack
				}
				//end Scrollview
			}
			//end nav stack
		}
		//end body
	}
	//end content View
}


#Preview{
	ContentView()
		.modelContainer(for: Plant.self, inMemory: true)

}
