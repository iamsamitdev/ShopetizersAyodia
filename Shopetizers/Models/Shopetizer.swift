//
//  Shopetizer.swift
//  Shopetizers
//
//  Created by Samit Koyom on 30/7/2565 BE.
//

import Foundation

struct Shopetizer: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let protein: Int
    let price: Double
    let imageURL: String
    let carbs: Int
    let calories : Int
    let description: String
    
}

struct ShopetizerResponse: Decodable {
    let request: [Shopetizer]
}

struct MockData {
    
    static let sampleShopetizer = Shopetizer(
        id: 001,
        name: "Test Shopetizer",
        protein: 20,
        price: 10.5,
        imageURL: "asian-flank-steak",
        carbs: 5,
        calories: 200,
        description: "This is the demo decription for Shopetizer"
    )
    
    static let shopetizers = [sampleShopetizer, sampleShopetizer, sampleShopetizer, sampleShopetizer]
    
    static let orderItemOne = Shopetizer(
            id: 0001,
            name: "Test Shopetizers One",
            protein: 20,
            price: 10.50,
            imageURL: "",
            carbs: 10,
            calories: 200,
            description: "This is the demo description for shopetizers one"
    )
    
    static let orderItemTwo = Shopetizer(
            id: 0002,
            name: "Test Shopetizers Two",
            protein: 20,
            price: 20.50,
            imageURL: "",
            carbs: 10,
            calories: 200,
            description: "This is the demo description for shopetizers two"
    )
    
    static let orderItemThree = Shopetizer(
            id: 0003,
            name: "Test Shopetizers Three",
            protein: 20,
            price: 30.50,
            imageURL: "",
            carbs: 10,
            calories: 200,
            description: "This is the demo description for shopetizers three"
    )
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
    
}
