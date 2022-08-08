//
//  ShopetizerListCell.swift
//  Shopetizers
//
//  Created by Samit Koyom on 30/7/2565 BE.
//

import SwiftUI

struct ShopetizerListCell: View {
    
    let shopetizer: Shopetizer
    
    var body: some View {
        HStack {
//            Image(shopetizer.imageURL)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)
            AsyncImage(url: URL(string: shopetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(shopetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(shopetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding()
        }
    }
}

struct ShopetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        ShopetizerListCell(shopetizer: MockData.sampleShopetizer)
    }
}
