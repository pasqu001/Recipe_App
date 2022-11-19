//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Kasey Pasqualini on 11/2/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    @State var selectedServingSize = 2
    
    var body: some View {
        ScrollView {
            
            
            VStack(alignment: .leading) {
                
                
                // MARK: Recipe Image
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Recipe Title
                Text(recipe.name)
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                
                
                //MARK: Serving Size Picker
                VStack(alignment: .leading){
                    Text("Select Your Serving Size:")
                        .font(Font.custom("Avenir", size: 15))
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }.font(Font.custom("Avenir", size: 15))
                    .pickerStyle(SegmentedPickerStyle())
                        .frame(width:160)
                }.padding()
                
                // MARK: Ingredients
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.top, .bottom], 5)
                    
                    ForEach(recipe.ingredients){ item in
                        Text("• " + RecipeModel.getPortion(Ingredient: item, recipeServings: recipe.servings, targetServings: selectedServingSize) + " " + item.name.lowercased())
                            .font(Font.custom("Avenir", size: 15))
                    }
                }.padding([.leading, .trailing], 15)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(Font.custom("Avenir Heavy", size: 16))
                        .padding([.top, .bottom], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 15))
                    }
                }.padding([.leading, .trailing], 15)
                
                
            }
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //create a dummy recipe and pass it into the detail view so that can see a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
