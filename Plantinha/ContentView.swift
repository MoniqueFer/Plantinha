//
//  ContentView.swift
//  Plantinha
//
//  Created by Monique Ferrarini on 07/08/24.
//

import SwiftUI
import SwiftData

struct Plant: Identifiable {
    
    var image: UIImage?
    
    var id = UUID()
    
    var name: String

    var notes: String
	
    var WaterFrequency: Int
//    var LastTimeWater: Date
    var FertilizerType: String
    var FertilizerFrequency: Int
    
    init(name: String, notes: String, WaterFrequency: Int, /*LastTimeWater: Date*/ FertilizerType: String, FertilizerFrequency: Int, image: UIImage) {
        self.name = name
        self.notes = notes
        self.WaterFrequency = WaterFrequency
//        self.LastTimeWater = LastTimeWater
        self.FertilizerType = FertilizerType
        self.FertilizerFrequency = FertilizerFrequency
        self.image = image
    }
    }


var PlantinhasList: [Plant] = [
    
        Plant(name: "Orquidea",
              notes: "é uma planta que gosta de umidade e queima se ficar mt exposta ao sol. Precisa regar quando as raizes estiverem acizentadas",
              WaterFrequency: 7,
              FertilizerType: "Bokashi",
              FertilizerFrequency: 15,
			  image: UIImage(resource: .orquideaPhoto)),
        
        
        Plant(name: "Cacto",
              notes: "Planta que gosta de sol e pouca água.",
              WaterFrequency: 20,
              FertilizerType: "Nenhum",
              FertilizerFrequency: 0, 
			  image: UIImage(resource: .orquideaPhoto)),
        
        Plant(name: "Peperômia",
              notes: "Não gosta de sol, somente claridade. Se deixar no sol no início fica bonita, mas depois queima toda. Tambem precisa de luz, se nao fica estranha. Melhor colocar água de baixo pra cima, pq as folhas ficam molengas com água",
              WaterFrequency: 6,
              FertilizerType: "Para plantas",
              FertilizerFrequency: 31, 
			  image: UIImage(resource: .orquideaPhoto))]
			  

struct ContentView: View {
    @State var myRows = Array(repeating: GridItem(.flexible()), count: 1)
    
    
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
                        LazyHGrid(rows: myRows, content: {
                            
                            ForEach(PlantinhasList) { plantinhaItem in
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
                        }
                                  //end lazy HGrid
                        )}
                    //end horizontal scrollview
                    
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
