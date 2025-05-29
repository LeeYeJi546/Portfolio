//
//  ShopView.swift
//  4th_assignment
//
//  Created by 이예지 on 4/10/25.
//

import SwiftUI

struct ShopView: View {
    @ObservedObject var viewModel: ShopViewModel = .init()
    let images1 = ["os1", "os2", "os3"]
    
    var body: some View {
        ZStack {
            Color(.white01).ignoresSafeArea()
            ScrollView {
                VStack(spacing: 5) {
                    Spacer()
                        .frame(height: 10)
                    OnlineStore
                    Spacer()
                    AllProducts
                    PageControl
                    NewProducts
                    Spacer()
                        .frame(height: 50)
                }
            }
        }
    }
    
    //Starbucks Online Store 가로 스크롤
    private var OnlineStore: some View {
        VStack(alignment: .leading) {
            Text("Starbucks Online Store")
                .font(.PretendardBold24)
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 27) {
                    ForEach(images1, id: \.self) { imageName in
                        Image(imageName)
                            .resizable()
                            .frame(width: 270, height: 216)
                    }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
        }
    }
    
    //All Products 가로 스크롤
    private var AllProducts: some View {
        VStack(alignment: .leading) {
            Text("All Products")
                .font(.PretendardBold24)
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 17) {
                    ForEach(viewModel.AllProductsList) { AP in
                        CircleImageCard2(model: AP)
                    }
                }
            }
            .padding(EdgeInsets(top: 10, leading: 20, bottom: 20, trailing: 20))
        }
    }
    
    //Best Items 페이지 컨트롤
    private var PageControl: some View {
        VStack(alignment: .leading) {
            Text("Best Items")
                .font(.PretendardBold24)
                .padding(.leading, 20)
            TabView {
                VStack {
                    BestItems1
                    Spacer()
                    Text(" ")
                        .padding(.bottom, 20)
                }
                BestItems2
            }
            .tabViewStyle(.page)
            .frame(height: 460)
        }
        .frame(width: 406, height: 556)
        
    }
    
    //페이지컨트롤 첫번째 페이지
    private var images2_1 = ["bi1", "bi2", "bi3", "bi4"]
    private var captions1_1 = ["그린 사이렌 슬리브 머그\n355ml", "그린 사이렌 클래식 머그\n355ml", "사이렌 머그 앤 우드 소서\n", "리저브 골드 테일 머그\n355ml"]
    
    // 그리드 열 정의
    private var columns1_1: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    private var BestItems1: some View {
        LazyVGrid(columns: columns1_1, spacing: 31) {
            ForEach(0..<images2_1.count, id: \.self) { index in
                VStack(spacing: 10) {
                    Image(images2_1[index])
                        .resizable()
                        .frame(width: 140, height: 141)
                    
                    Text(captions1_1[index])
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,35)
                        .font(.PretendardSemiBold14)
                }
            }
        }
        .padding()
    }
    
    //페이지컨트롤 두번째 페이지
    private var images2_2 = ["bi5", "bi6", "bi7", "bi8"]
    private var captions1_2 = ["블랙 앤 골드 머그 473ml", "블랙 링 머그 355ml","북청사자놀음 데미머그\n89ml", "서울 제주 데미머그 세트\n"]
    
    // 그리드 열 정의
    private var columns1_2: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    private var BestItems2: some View {
        LazyVGrid(columns: columns1_2, spacing: 31) {
            ForEach(0..<images2_2.count, id: \.self) { index in
                VStack(spacing: 10) {
                    Image(images2_2[index])
                        .resizable()
                        .frame(width: 140, height: 141)
                    
                    Text(captions1_2[index])
                        .font(.caption)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,35)
                        .font(.PretendardSemiBold14)
                }
            }
        }
        .padding()
    }
    
    
    //New Products 그리드
    private var images3 = ["np1", "np2", "np3", "np4"]
    private var captions2 = ["그린 사이렌 도트 머그\n237ml", "그린 사이렌 도트 머그\n355ml", "홈 카페 미니 머그 세트", "홈 카페 글라스 세트"]
    
    // 그리드 열 정의
    private var columns2: [GridItem] = [
        GridItem(.flexible(), spacing: 5),
        GridItem(.flexible(), spacing: 5)
    ]
    private var NewProducts: some View {
        VStack(alignment: .leading) {
            Text("New Products")
                .font(.PretendardBold24)
                .padding(.leading, 20)
            LazyVGrid(columns: columns2, spacing: 31) {
                ForEach(0..<images3.count, id: \.self) { index in
                    VStack(spacing: 10) {
                        Image(images3[index])
                            .resizable()
                            .frame(width: 140, height: 141)
                        
                        Text(captions2[index])
                            .font(.caption)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading,35)
                            .font(.PretendardSemiBold14)
                    }
                }
            }
        }
    }
}
    
    
#Preview {
    ShopView()
}
