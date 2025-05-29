//
//  CircleImageCard.swift
//  3rd_assignment
//
//  Created by 이예지 on 4/4/25.
//

import SwiftUI

protocol ImageDisplayable1 {
    var imageName: String { get }
    var titleText: String { get }
}

protocol ImageDisplayable2 {
    var imageName: String { get }
    var korText: String { get }
    var engText: String { get }
}

struct CircleImageCard<T: ImageDisplayable1>: View {
    let model: T

    var body: some View {
        VStack(spacing: 10) {
            Image(model.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 1000, height: 130)
                .clipShape(Circle()) // 동그랗게 자르기
            Text(model.titleText)
                .font(.PretendardSemiBold14)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .foregroundStyle(Color.black)
        }
        .frame(width: 130, height: 200)
    }
}

struct CircleImageCard2<T: ImageDisplayable1>: View {
    let model: T

    var body: some View {
        VStack(spacing: 10) {
            Image(model.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
            Text(model.titleText)
                .font(.PretendardSemiBold13)
                .multilineTextAlignment(.center)
                .lineLimit(1)
                .foregroundStyle(Color.black)
        }
        .frame(width: 80, height: 100)
    }
}

struct IconButtonCard<T: ImageDisplayable1>: View {
    let model: T
    
    var body: some View {
        Button(action: {
            print(model.titleText)
            }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white)
                            .frame(width: 102, height: 108)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray03.opacity(0.2), lineWidth: 1)
                                )
                        VStack(spacing:10) {
                            Image(model.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 38, height: 38)
                            
                            Text(model.titleText)
                                .font(.PretendardSemiBold14)
                                .foregroundColor(.black)
                        }
                        
                    }
            }
    }
}


struct bottomCoffeeMenuCard<T: ImageDisplayable2>: View {
    let model: T
    
    var body: some View {
        HStack(spacing: 10) {
            Image(model.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .clipShape(Circle()) // 동그랗게 자르기
            VStack(alignment: .leading, spacing: 4) {
                Text(model.korText)
                    .font(.PretendardSemiBold16)
                    .foregroundStyle(Color.gray06)
                Text(model.engText)
                    .font(.PretendardSemiBold13)
                    .foregroundStyle(Color.gray03)
            }
            Spacer()
        }
        .frame(width: 386, height: 60)
        .padding(.leading, 23)
        .padding(.top, 13)
    }
}
