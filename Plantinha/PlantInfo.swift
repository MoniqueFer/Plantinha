//
//  PlantInfo.swift
//  Plantinha
//
//  Created by Monique Ferrarini on 07/08/24.
//

import SwiftUI

struct PlantInfo: View {
    
    @State var wButtonPressed: Bool = false
    @State var fButtonPressed: Bool = false

    let plantinhaItem : Plant
    
    var body: some View {
        
        ScrollView {
                        
                VStack {
                    
                    Image("orquideaPhoto")
                        .resizable()
                        .scaledToFill()
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                        .frame(width: 300, height: 290)
                    
                    
                    
                    Text(plantinhaItem.name)
                        .font(.largeTitle)

                    
                    VStack{
                        HStack {
                            Image("waterIcon")
                            Text("  \(plantinhaItem.WaterFrequency) days")
                        }
                        HStack{
                            Image("fertilizerIcon")
                            Text("\(plantinhaItem.FertilizerFrequency) days")
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
                            wButtonPressed.toggle()
                        }) {
                            Image("doneWater")
                                .resizable()
                                .shadow(radius: 15, y: 5)
                        }
                        
                        if wButtonPressed {
                            waterButton.buttonStyle(taskDone())
                        } else {
                            waterButton
                        }
                        
                        
                        let fertilizerButton = Button(action: {
                            fButtonPressed.toggle()
                        }) {
                            Image("doneFertilizer")
                                .resizable()
                                .shadow(radius: 15, y: 5)
                            
                        }
                        if fButtonPressed {
                            fertilizerButton.buttonStyle(taskDone())
                        } else {
                            fertilizerButton
                        }
                        
                    }
                    .frame(width: 220, height: 100)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    .padding(.leading)
                    
                    
                    .toolbar{
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink(
                                destination: AddNewPlant())  {
                                    Text("Edit")
                                }
                        }
                        
                        
                    }
                    
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
    
    PlantInfo(plantinhaItem: PlantinhasList[0]
    )
}
