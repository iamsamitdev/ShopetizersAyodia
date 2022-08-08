//
//  NetworkManager.swift
//  Shopetizers
//
//  Created by Samit Koyom on 30/7/2565 BE.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let baseURL = "https://www.itgenius.co.th/sandbox_api/"
    private let shopetizerURL = baseURL + "shopetizers"
    
    private init() {}
    
    // สร้าง Method อ่านข้อมูลจาก API
    func getShopetizers(completed: @escaping(Result<[Shopetizer], NetworkError>) -> Void) {
        
        guard let url = URL(string: shopetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse =  try decoder.decode(ShopetizerResponse.self, from: data)
                completed(.success(decodedResponse.request))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
        
    }
}
