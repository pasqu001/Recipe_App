//
//  RecipeDetailView.swift
//  Recipe List App
//
//  Created by Kasey Pasqualini on 11/2/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:Recipe
    
    var body: some View {
        ScrollView {
            
            
            VStack(alignment: .leading) {
                
                
                // MARK: Recipe Image
                
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                
                // MARK: Ingredients
                
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    
                    ForEach(recipe.ingredients){ item in
                        Text("• " + item.name)
                    }
                }.padding([.leading, .trailing], 15)
                
                // MARK: Divider
                Divider()
                
                // MARK: Directions
                
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.top, .bottom], 5)
                    
                    ForEach(0..<recipe.directions.count, id: \.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                            .padding(.bottom, 5)
                    }
                }.padding([.leading, .trailing], 15)
                
                
            }
        }.navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //create a dummy recipe and pass it into the detail view so that can see a preview
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
