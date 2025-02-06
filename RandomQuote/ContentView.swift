//
//  ContentView.swift
//  RandomQuote
//
//  Created by Ivan Ravena Pinheiro Ribeiro on 04/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var quote: String = "when the mind is controlled and spirit aligned with purpose, the body is capable of so much more than we realize."

    var author = "Rich Roll"
    var source = "Finding Ultra"
    var caption = "Rejecting Middle Age, Becoming One of the World's Fittest Men, and Discovering Myself"
    var sourceLink = "linkedin.com/ivanravena"
    
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
                
                // Test button
                Button("Quote test") {
                    fetchQuote()
                }
                
                
                
            }
            .onAppear {
                let savedQuote = UserDefaults.standard.string(forKey: "dailyQuote") ?? ""
                let lastFetchDate = UserDefaults.standard.object(forKey: "lastFetchDate") as? Date ?? Date.distantPast
                
                if Calendar.current.isDateInToday(lastFetchDate) {
                    quote = savedQuote
                } else {
                    fetchQuote()
                    UserDefaults.standard.set(Date(), forKey: "lastFetchDate")
                }
            }
            
       
        }
        .padding(32)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.dark)
        
    }
    
    // GPT function to generate new quote

    func fetchQuote() {
        
        let apiKey = "AA"
        
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        
        let prompt =  "Give some inspirational short quote"
     
        let requestBody: [String: Any] = [
                "model": "gpt-3.5-turbo",
                "messages": [["role": "user", "content": prompt]],
                "temperature": 0.7
            ]
        
        var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                       let choices = json["choices"] as? [[String: Any]],
                       let message = choices.first?["message"] as? [String: Any],
                       let content = message["content"] as? String {
                        DispatchQueue.main.async {
                            quote = content.trimmingCharacters(in: .whitespacesAndNewlines)
                            UserDefaults.standard.set(quote, forKey: "dailyQuote")
                        }
                    }
                }
            }.resume()
    }
    
}

#Preview {
    ContentView()
}
