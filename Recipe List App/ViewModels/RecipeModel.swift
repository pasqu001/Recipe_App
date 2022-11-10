//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Kasey Pasqualini on 11/1/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
   @Published var recipes = [Recipe]()
    
    init() {
        //create an instance of dataService and get the data
        let service = DataService()
        
        self.recipes = service.getLocalData()
        
    }
}

