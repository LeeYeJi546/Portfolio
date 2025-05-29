//
//  ShopViewModel.swift
//  4th_assignment
//
//  Created by 이예지 on 4/10/25.
//

import Foundation

class ShopViewModel: ObservableObject {
    
    @Published var AllProductsList: [APModel] = [
        APModel(imageName:"ap1", titleText:"텀블러"),
        APModel(imageName:"ap2", titleText:"커피 용품"),
        APModel(imageName:"ap3", titleText:"선물세트"),
        APModel(imageName:"ap4", titleText:"보온병"),
        APModel(imageName:"ap5", titleText:"머그/컵"),
        APModel(imageName:"ap6", titleText:"라이프스타일")
    ]
    
    
}

