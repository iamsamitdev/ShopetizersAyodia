//
//  ShopetizerListViewModel.swift
//  Shopetizers
//
//  Created by Samit Koyom on 30/7/2565 BE.
//

import SwiftUI

final class ShopetizerListViewModel: ObservableObject {
    
    // โหลด Model Shopetizer มาใช้งาน
    @Published var shopetizers: [Shopetizer] = []
    
    // โหลด Alert
    @Published var alertItem: AlertItem?
    
    // สร้างตัวแปร State ไว้แสดงหน้า Detail
    @Published var isShowingDetail = false
    
    // สร้างตัวแปร State ไว้เก็บรายการที่เลือก
    @Published var selectedShopetizer: Shopetizer?
    
    // สร้างตัวแปร State ไว้เก็บสถานะการ loading
    @Published var isLoading = false
    
    
    // สร้าง Method ไว้อ่านข้อมูลรายการสินค้า
    func getShopetizers(){
        
        // แสดง Loading
        isLoading = true
        
        NetworkManager.shared.getShopetizers { result in
            
            // เขียนส่วนการแสดงผลจาก API ไว้ใน Main Thread
            DispatchQueue.main.async { [self] in
                
                // ซ่อน Loading
                isLoading = false
                
                switch result {
                    case .success(let shopetizers):
                    self.shopetizers = shopetizers
                    isLoading = false
                    
                case .failure(let error):
                    // print(error.localizedDescription)
                    switch error {
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                        
                    }
                }
                
            }
            
        }
        
    }
    
}
