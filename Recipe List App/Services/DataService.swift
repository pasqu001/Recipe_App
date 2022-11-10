//
//  DataService.swift
//  Recipe List App
//
//  Created by Kasey Pasqualini on 11/1/22.
//

import Foundation

class DataService {
    
    func getLocalData() -> [Recipe]{
        
        //parse local json file
        //Step 1 -> get a url path to the json file
        
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //check if pathString is not nil otherwise return empty recipe list
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //Step 2 -> create a url object
             //bc we check above that it is not nil we can safely unwrap it with a !
        
        let url = URL(fileURLWithPath: pathString!)
        
        //Step 3 -> create a data object
        
        do {
            
            let data = try Data(contentsOf: url)
            
            
            //Step 4 -> Decode the data with JSON decoder
            
            let decoder = JSONDecoder()
            
            do {
                
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //Step 5 -> Add unique ID's
                
                for r in recipeData {
                    r.id = UUID()
                    
                    //give Indgredients a UUID as well
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                    
                    
                    
                }
                
                //Step 6 -> Return the recipes
                return recipeData
            }
            catch{
                //error with parsing JSON
                
                print(error)
                
            }
    
        }
        catch{
            //error with getting data
            
            print(error)
        }
        
       return [Recipe]()
        
    }
}
