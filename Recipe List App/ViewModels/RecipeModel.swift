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
    
    //all the math for the serving size
    
    static func getPortion(Ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = Ingredient.num ?? 1
        var denominator = Ingredient.denom ?? 1
        var wholePortions = 0
        
        if Ingredient.num != nil {
            
            //Get single serving size by mutiplying denominator by the recipes servings
            
            denominator *= recipeServings
            
            //Get target portion by mutiplying numerator by target servings
            
            numerator *= targetServings
            
            //Reduce fraction by the greatest common divisor
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get whole portions in numerator is greater than denominator
            
            if numerator >= denominator {
                
                wholePortions = numerator / denominator
                
                numerator = numerator % denominator
                
                portion += String(wholePortions)
            }
            
            //express the remainder as a fraction
            
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        
        if var unit = Ingredient.unit {
            
            
            if wholePortions > 1 {
                
                //calculate appropriet suffix
                
                if unit.suffix(2) == "ch" {
                    unit += "es"
                
                }
                else if unit.suffix(1) == "f" {
                    
                    unit = String(unit.dropLast())
                    unit += "ves"
                    
                }
                else {
                    unit += "s"
                }
                
            }
            
            
            portion += Ingredient.num == nil && Ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        
        return portion
        
    }
}

