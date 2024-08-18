//
//  RoosterStartView.swift
//  roosterQuizzset
//
//  Created by galen on 2024/8/18.
//

import SwiftUI

struct RoosterStartView: View {
    var body: some View {
        ZStack {
            // 背景图片，设置为缩放填充，并带有 30% 的透明度
            Image("rooster_bg")
                .resizable()
                .scaledToFill()
                .opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            
            VStack() {
                Text("RoosterQuizlyiess")
                    .font(.custom("Poppins-Bold", size: 40))
                    .foregroundColor(Color(hex: "#000000"))
                // 按钮组
                VStack(spacing: 20) {
                    createNavigationButton(title: "Very Easy Level", destination: RoosterGameView(isFrom: "VeryEasy"))
                    createNavigationButton(title: "Easy Level", destination: RoosterGameView(isFrom: "Easy"))
                    createNavigationButton(title: "Medium Level", destination: RoosterGameView(isFrom: "Medium"))
                    createNavigationButton(title: "Hard Level", destination: RoosterGameView(isFrom: "Hard"))
                    createNavigationButton(title: "Very Hard Level", destination: RoosterGameView(isFrom: "VeryHard"))
                    createNavigationButton(title: "About Rooster", destination: RoosterAboutView())
                    createNavigationButton(title: "About Us", destination: RoosterUsView())
                }
                .frame(width: 400)
                .shadow(radius: 5)
            }
        }
    }
    
    // 创建带导航功能的按钮
    func createNavigationButton<Destination: View>(title: String, destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            Text(title)
                .font(.custom("Poppins-Regular", size: 18))
                .foregroundColor(Color(hex: "#000000"))
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(hex: "#6F85EE"))
                .cornerRadius(50)
        }
        .padding(.horizontal, 20)
    }
}

struct RoosterStartPreview: PreviewProvider {
    static var previews: some View {
        RoosterStartView()
    }
}
