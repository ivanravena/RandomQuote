//
//  ContentView.swift
//  RandomQuote
//
//  Created by Ivan Ravena Pinheiro Ribeiro on 04/02/25.
//

import SwiftUI

var quote = "when the mind is controlled and spirit aligned with purpose, the body is capable of so much more than we realize."
var author = "Rich Roll"
var source = "Finding Ultra"
var caption = "Rejecting Middle Age, Becoming One of the World's Fittest Men, and Discovering Myself"
var sourceLink = "linkedin.com/ivanravena"

struct ContentView: View {
    var body: some View {
        // Background dark
        ZStack {
            
            //Container
            VStack(alignment: .leading) {
              
                Spacer()
                
                Image(.iconOpening)
                
                Spacer()
                
                // Quote
                Text(quote)
                    .foregroundStyle(Color.light)
                    .fontDesign(.serif)
                    .font(.largeTitle)
                
                Spacer()
                
                // Author
                HStack {
                    
                    Image(.iconClosing)
                    
                    Text(author)
                        .foregroundStyle(Color.light)
                        .fontDesign(.serif)
                        .font(.title2)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                // Source card
                HStack(spacing: 16) {
                    
                    //Source title and caption stack
                    VStack(alignment: .leading) {
                        
                        Text(source)
                            .foregroundStyle(Color.primary)
                            .fontDesign(.serif)
                            .font(.headline)
                        Text(caption)
                            .foregroundStyle(Color.light)
                            .fontDesign(.serif)
                            .font(.footnote)
                        
                    }
    
                    // Chevron
                    Image(systemName: "chevron.right")
                        .foregroundStyle(Color.light)
                    
                }
                .padding(16)
                .background(Color.surface)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .frame(maxWidth: .infinity)
                
            }
            
       
        }
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.dark)
        
    }
}

#Preview {
    ContentView()
}
