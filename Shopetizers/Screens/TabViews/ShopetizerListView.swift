//
//  ShopetizerListView.swift
//  Shopetizers
//
//  Created by Samit Koyom on 30/7/2565 BE.
//

import SwiftUI

struct ShopetizerListView: View {
    
    // โหลดตัวแปร shopetizers จาก ViewModel มาใช้งาน
    @StateObject var viewModel = ShopetizerListViewModel()
    
    var body: some View {
            ZStack {
                NavigationView {
                    List(viewModel.shopetizers) { shopetizer in
                        ShopetizerListCell(shopetizer: shopetizer)
                            .onTapGesture {
                                // print(shopetizer.id)
                                viewModel.selectedShopetizer = shopetizer
                                viewModel.isShowingDetail = true
                            }
                    }
                    .listStyle(.plain)
                    .navigationTitle("🍟 Shopetizers")
                    .disabled(viewModel.isShowingDetail)
                }
                .navigationViewStyle(.stack)
                .onAppear{
                    viewModel.getShopetizers()
                }
                .blur(radius: viewModel.isShowingDetail ? 20 : 0)
                
                
                if viewModel.isShowingDetail {
                    ShopetizerDetailView(
                        shopetizer: viewModel.selectedShopetizer!,
                        isShowingDetail: $viewModel.isShowingDetail)
                }
                
                // แสดง loading หากยังโหลดข้อมูลไม่เสร็จ
                if viewModel.isLoading {
                    LoadingView(loadingTitle: "กำลังโหลดรายการสินค้า")
                }
                
            }
            .alert(item: $viewModel.alertItem){ alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }
    }
    
}

struct ShopetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopetizerListView()
    }
}
