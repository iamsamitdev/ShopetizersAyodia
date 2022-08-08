//
//  NetworkError.swift
//  Shopetizers
//
//  Created by Samit Koyom on 30/7/2565 BE.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
