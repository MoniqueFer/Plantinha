//
//  PlantinhaApp.swift
//  Plantinha
//
//  Created by Monique Ferrarini on 07/08/24.
//

import SwiftUI
import SwiftData

@main
struct PlantinhaApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        //here i call the modelcontainer of the entity User.
        .modelContainer(for: Plant.self)
    }
}






//
//                Button("add item") {
//                    addItem()
//                }
//            }
//        }
//
//
//        //putting the data pulled of in a list
//        List {
//            ForEach(items) { item  in
//                Text(item.name)
//            }
//            .onDelete { indexes in
//                for index in indexes {
//                    deleteItem(items[index])
//}
//
//}
//
//}


//    func addItem(){
//        //create the item
//        let myitem = User(name: "Moni")
//        //add the item to the data context
//        context.insert(myitem)
//
//    }
//
//    func deleteItem(_ item: User) {
//            context.delete(item)
//        }
//
//    }
