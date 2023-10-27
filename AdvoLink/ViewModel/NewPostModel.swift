//
//  NewPostModel.swift
//  testApp
//
//  Represents a post made by a user
//
//  Created by Charlotte Zhou on 10/26/23.
//

import Foundation

class NewPostModel: ObservableObject {
    @Published var title = ""
    @Published var startDate = Date()
    @Published var endDate = Date()
    @Published var description = ""
}
