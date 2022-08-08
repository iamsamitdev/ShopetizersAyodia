//
//  OrderView.swift
//  Shopetizers
//
//  Created by Samit Koyom on 30/7/2565 BE.
//

import SwiftUI

struct OrderView: View {
    
    // @State private var orderItem = MockData.orderItems
    // @StateObject private var viewModel = OrderViewModel()
    @EnvironmentObject var order: OrderViewModel
    
    var body: some View {
        NavigationView {
            
            if !order.items.isEmpty {
                ZStack {
                    VStack {
                        List {
                            ForEach(order.items) { shopetizer in
                                ShopetizerListCell(shopetizer: shopetizer)
                                    .listRowSeparator(.hidden)
                            }
                            
                            // .onDelete(perform: { indexSet in
                            //     order.items.remove(atOffsets: indexSet)
                            // })
                            .onDelete(perform: order.deleteItems)
                        }
                        .listStyle(.plain)
                        
                        Button {
                            print("Order Placed")
                        } label: {
                            Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color.accentColor)
                        .controlSize(.large)
                        .padding(.bottom, 25)
                    }
                    .navigationTitle("🧾 Orders")
                }
            }
            
            // เช็คว่าถ้าไม่มีรายการในหน้านี้
            if order.items.isEmpty {
                ZStack {
                    VStack {
                        Image("empty-order")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 150)
                        Text("ยังไม่มีรายการสินค้า \nกรุณาไปสั่งรายการสินค้าก่อน")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding()
                    }
                    .offset(y: -50)
                    .navigationTitle("🧾 Orders")
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct OrderView_Previews: PreviewProvider {
    
    static var previews: some View {
        OrderView().environmentObject(OrderViewModel())
    }
}
