//
//  ExploreView.swift
//  ExploreView
//
//  Created by Sahana Suresh on 10/26/23.
//
import SwiftUI
struct ExploreView: View {
    var body: some View {
        VStack {
            ScrollView{
                ForEach(blog) { blog in
                    CardView(image: blog.image, category: blog.category, heading: blog.heading, author: blog.author)
                }
                
            }
            .padding()
        }
    }
    
    struct ExploreView_Previews: PreviewProvider {
        static var previews: some View {
            ExploreView()
        }
    }
    
    struct CardView: View{
        
        var image: String
        var category: String
        var heading: String
        var author: String
        
        var body: some View{
            VStack{
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                HStack{
                    VStack (alignment: .leading){
                        Text(category)
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(heading)
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text("Written by ".uppercased() + author.uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(100)
                    Spacer()
                }
                .padding()
            }
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.2), lineWidth: 1)
            )
            .padding(.bottom)
        }
    }
}

