//
//  ContentView.swift
//  roosterQuizzset
//
//  Created by galen on 2024/8/18.
//

import SwiftUI
import StoreKit

struct RoosterHomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("rooster_bg")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 20) {
                    // 标题标签
                    Text("RoosterQuizlyiess")
                        .font(.custom("Poppins-Bold", size: 24))
                        .fontWeight(.bold)  // 添加这个修饰符来确保文本加粗
                        .foregroundColor(Color(hex: "#000000"))
                        .padding(.top, 60)
                    
                    // 图像视图
                    Image("my_rooster_icon") // 替换为你的图片名称
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180, height: 180)
                        .padding(.top, 50)
                    
                    // 介绍文本标签
                    Text("Welcome to RoosterQuizlyiess!")
                        .font(.custom("Poppins-Regular", size: 16))
                        .foregroundColor(Color(hex: "#000000"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // 按钮组
                    VStack(spacing: 20) {
                        NavigationLink(destination: RoosterStartView()) {
                            createButton(title: "Start Now")
                                .frame(width: 350)
                        }
                        
                        Button(action: {
                            shareApp()
                        }) {
                            createButton(title: "Share App")
                                .frame(width: 350)
                        }
                        
                        Button(action: {
                            rateApp()
                        }) {
                            createButton(title: "Rate App")
                                .frame(width: 350)
                        }
                        
                        Button(action: {
                            openPrivacyPolicy()
                        }) {
                            createButton(title: "Privacy Policy")
                                .frame(width: 350)
                        }
                    }
                    .padding(.horizontal, 40)  // 增加按钮组的水平内边距
                    .padding(.bottom, 10)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(.horizontal, 40)  // 在VStack整体添加水平内边距
                .padding(.bottom, 50)      // 增加底部内边距，以避免与屏幕底部重叠
                .cornerRadius(20)
            }
            .navigationBarHidden(true)
        }
    }
    
    // 创建按钮的方法
    func createButton(title: String) -> some View {
        Text(title)
            .font(.custom("Poppins-Regular", size: 18))
            .foregroundColor(Color(hex: "#000000"))
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .cornerRadius(50)
            .shadow(radius: 5)
    }
    
    // 分享应用的方法
    func shareApp() {
        let objectsToShare = ["RoosterQuizlyiess"]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let rootVC = windowScene.windows.first?.rootViewController {
                rootVC.present(activityVC, animated: true, completion: nil)
            }
        }
    }
    
    // 评分应用的方法
    func rateApp() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        }
    }
    
    // 打开隐私政策的方法
    func openPrivacyPolicy() {
        guard let url = URL(string: "https://www.termsfeed.com/live/8f11b98b-52b4-4db9-81df-9af0a826b539") else { return }
        UIApplication.shared.open(url)
    }
}


// 颜色扩展
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8 * 4), (int >> 4 & 0xF) * 17, int & 0xF * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}


struct RoosterStartView_Previews: PreviewProvider {
    static var previews: some View {
        RoosterHomeView()
    }
}
