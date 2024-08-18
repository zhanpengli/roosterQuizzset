//
//  RoosterFinalView.swift
//  roosterQuizzset
//
//  Created by galen on 2024/8/18.
//

import SwiftUI

struct RoosterFinalView: View {
    let score: Int  // 接收分数
        
        var body: some View {
            ZStack {
                Image("rooster_bg")
                    .resizable()
                    .scaledToFill()
                    .opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("Final Score")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("You scored \(score) points!")
                        .font(.title)
                        .padding()
                    
                    // 可以在这里添加更多内容或功能，比如重试按钮或回到主菜单按钮
                }
                .navigationBarTitle("Quiz Results", displayMode: .inline)
            }
        }
}

// 视图预览
struct RoosterFinalView_Previews: PreviewProvider {
    static var previews: some View {
        RoosterFinalView(score: 0)
    }
}

