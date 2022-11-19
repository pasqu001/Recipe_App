//
//  RecipeHighLights.swift
//  Recipe List App
//
//  Created by Kasey Pasqualini on 11/18/22.
//

import SwiftUI

struct RecipeHighLights: View {
    
    var allHighlights = ""
    
    init(highlights:[String]){
        
        //Loop thru highlights and build the String
        
        for index in 0..<highlights.count {
            
            //if this is the last item dont add a comma ->
            
            if index == highlights.count - 1 {
                allHighlights+=highlights[index]
            }
            else{
                allHighlights += highlights[index] + ", "
        }

        }
        
    }
    
    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighLights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighLights(highlights: ["Test1", "test2"])
    }
}
