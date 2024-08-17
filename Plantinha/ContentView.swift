//
//  ContentView.swift
//  Plantinha
//
//  Created by Monique Ferrarini on 07/08/24.
//

import SwiftUI
import SwiftData

var plantinhasList: [Plant] = [
	
//	Plant(name: "Orquidea",
//		  notes: "é uma planta que gosta de umidade e queima se ficar mt exposta ao sol. Precisa regar quando as raizes estiverem acizentadas",
//		  waterFrequency: 7,
//		  lastTimeWater: Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 18))!,
//		  fertilizerType: "Bokashi",
//		  fertilizerFrequency: 15,
//		  image: UIImage(resource: .orquideaPhoto),
//		  lastTimeFertilizer: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day:10))!
//		 ),
//	
//	
//	Plant(name: "Cacto",
//		  notes: "Planta que gosta de sol e pouca água.",
//		  waterFrequency: 20,
//		  lastTimeWater: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 10))!,
//		  fertilizerType: "Nenhum",
//		  fertilizerFrequency: 0,
//		  image: UIImage(resource: .plantPhoto),
//		  lastTimeFertilizer: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day:10))!
//		 ),
//		  
//	
//	Plant(name: "Peperômia",
//		  notes: "Não gosta de sol, somente claridade. Se deixar no sol no início fica bonita, mas depois queima toda. Tambem precisa de luz, se nao fica estranha. Melhor colocar água de baixo pra cima, pq as folhas ficam molengas com água",
//		  waterFrequency: 6,
//		  lastTimeWater: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 7))!,
//		  fertilizerType: "Para plantas",
//		  fertilizerFrequency: 31,
//		  image: UIImage(resource: .orquideaPhoto),
//		  lastTimeFertilizer: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day:10))!
//   )

]


struct ContentView: View {
	@State var myRows = Array(repeating: GridItem(.flexible()), count: 1)
	
	//creating a instance of the class that holds the list insite the view to act like a "subscriber" to any changes in the list and be notified of it.
	@ObservedObject var myList = PlantsList()
	
	//specifing the path to the context
	//    @Environment(\.modelContext) private var context
	
	//getting the data out of database to be show
	//    @Query private var items: [Plant]
	
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
								AddNewPlant(myList: myList)
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
								
								ForEach(myList.theList) { plantinhaItem in
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
}
