//
//  PlantInfo.swift
//  Plantinha
//
//  Created by Monique Ferrarini on 07/08/24.
//

import SwiftUI

struct PlantInfo: View {
    
    @State var waterButtonPressed: Bool = false
    @State var fertilizerButtonPressed: Bool = false

    let plantinhaItem : Plant
    
    var body: some View {
        
        ScrollView {
                        
                VStack {
                    
					Image(uiImage: plantinhaItem.image!)
                        .resizable()
                        .scaledToFill()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 300, height: 290)
                    
                    
                    
                    Text(plantinhaItem.name)
                        .font(.largeTitle)

                    
                    VStack{
                        HStack {
                            Image("waterIcon")
                            Text("  \(plantinhaItem.waterFrequency) days")
                        }
                        HStack{
                            Image("fertilizerIcon")
                            Text("\(plantinhaItem.fertilizerFrequency) days")
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    
                    
                    Text(plantinhaItem.notes)
                        .padding()
                        .padding(.bottom, 20)
                        .padding(.top, 20)
                        .background(
                            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
								.fill(Color.myColorPink.opacity(0.34).gradient)
								.stroke(Color.myColorPink, lineWidth: 1)
                        )
                        .padding()
                    
                    Text("What I need today:")
                        .font(.title)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/ ,alignment: .leading)
                        .padding(.leading)
                    
                    HStack (spacing: 20) {
                        
                        let waterButton = Button(action: {
                            waterButtonPressed.toggle()
                        }) {
                            Image("doneWater")
                                .resizable()
                                .shadow(radius: 15, y: 5)
                        }
                        
                        if waterButtonPressed {
                            waterButton.buttonStyle(taskDone())
                        } else {
                            waterButton
                        }
                        
                        
                        let fertilizerButton = Button(action: {
                            fertilizerButtonPressed.toggle()
                        }) {
                            Image("doneFertilizer")
                                .resizable()
                                .shadow(radius: 15, y: 5)
                            
                        }
                        if fertilizerButtonPressed {
                            fertilizerButton.buttonStyle(taskDone())
                        } else {
                            fertilizerButton
                        }
                        
                    }
                    .frame(width: 220, height: 100)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(.leading)
                    
                    
//                    .toolbar{
//                        ToolbarItem(placement: .topBarTrailing) {
//                            NavigationLink(
//                                destination: AddNewPlant(myList: myList))  {
//                                    Text("Edit")
//                                }
//                        }
//                        
//                        
//                    }
                    
                }
            
		}.background(Color.myColorYellow.opacity(0.30))
            
        
    }
}

struct taskDone: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                Circle()
                    .stroke(lineWidth: 5)
                    .fill(Color.green)
            )
            .overlay(
                Circle()
                    .fill(Color.green)
                    .frame(width: 30)
                    .overlay(
                        Image(systemName: "checkmark")
                            .foregroundStyle(.white)
                    )
                ,alignment: .bottomTrailing
            )
        
    }
}


#Preview {
    
    PlantInfo(plantinhaItem: plantinhasList[0]
    )
}
