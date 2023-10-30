//
//  CreateView.swift
//  testApp
//
//  Created by Charlotte Zhou on 10/25/23.
//

import SwiftUI

struct CreateView: View {
    @StateObject var viewModel = NewPostModel()
    var body: some View {
        NavigationView{
            VStack{
                Form {
                    Section(header: Text("Event Details")){
                        // Title
                        TextField("Title", text: $viewModel.title)
                        
                        // Date
                        DatePicker("Event Start", selection: $viewModel.startDate)
                        DatePicker("Event End", selection: $viewModel.endDate)
                    }
                    Section(header: Text("Description")) {
                        VStack(alignment: .leading) {
                           TextEditor(text: $viewModel.description)
                               .frame(height: 100) // Set the desired height
                       }
                    }
                }
                Button ("Publish"){
                    //Action
                }
                .bold()
                .frame(width:100, height:50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .foregroundColor(.white)
                .background(Color("Purple"))
                .padding(5)
            }
            .navigationTitle("Create a new post")
        }
    }
}

#Preview {
    CreateView()
}
