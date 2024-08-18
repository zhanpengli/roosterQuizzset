//
//  RoosterUsView.swift
//  roosterQuizzset
//
//  Created by galen on 2024/8/18.
//

import SwiftUI

struct RoosterUsView:View {
    @State private var text: String = """
       Welcome to the exciting world of the Chicken Quiz Game! This fun and engaging trivia game challenges your knowledge about chickens and related topics.

       In the Chicken Quiz Game, you'll face a series of multiple-choice questions that cover everything from chicken breeds and behaviors to their role in culture and history. Each level offers a different difficulty, allowing players of all ages and expertise levels to enjoy the challenge.

       As you progress through the game, you'll encounter questions that will test your understanding of chicken anatomy, their dietary habits, and their importance in ecosystems around the world.

       So, are you ready to test your chicken knowledge and rise to the top of the pecking order? Join the Chicken Quiz Game now and see how many questions you can answer correctly!
       """
       
       @State private var showCopiedAlert: Bool = false // 控制复制成功后的提示框显示
       
       var body: some View {
           ZStack {
               // 图像视图，设置透明度
               Image("rooster_bg")
                   .resizable()
                   .scaledToFill()
                   .opacity(0.5)
                   .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                   .edgesIgnoringSafeArea(.all)
               VStack {
                   // 文本视图
                   TextEditor(text: $text) // 绑定文本内容
                       .padding(.horizontal, 40)
                       .padding(.top,1)
                       .border(Color.blue, width: 0)
                   
                   // 按钮组
                   HStack {
                       Button(action: {
                           // 共享操作，调用Share Sheet
                           shareText()
                       }) {
                           Text("Share")
                               .font(.headline)
                               .foregroundColor(.white)
                               .padding()
                               .frame(maxWidth:.infinity)
                               .background(Color.green)
                               .cornerRadius(10)
                       }.frame(maxWidth: 170)
                       
                       Button(action: {
                           // 复制文本到剪贴板
                           copyTextToClipboard()
                       }) {
                           Text("Copy")
                               .font(.headline)
                               .foregroundColor(.white)
                               .padding()
                               .frame(maxWidth: .infinity)
                               .background(Color.orange)
                               .cornerRadius(10)
                       }.frame(maxWidth: 170)
                   }
                   .padding(.horizontal) // 按钮组的水平内边距
                   .padding()
               }
               .alert(isPresented: $showCopiedAlert) {
                   // 显示复制成功的提示框
                   Alert(
                       title: Text("Copied!"),
                       message: Text("About rat has been copied to the clipboard."),
                       dismissButton: .default(Text("OK"))
                   )
               }
               .navigationTitle("About Rooster") // 设置导航栏标题
               .navigationBarTitleDisplayMode(.inline) // 设置标题显示模式
               .opacity(0.9)
           }
       }
       
       // 共享文本内容的函数
       func shareText() {
           let activityController = UIActivityViewController(activityItems: [self.text], applicationActivities: nil)
           if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
               if let rootVC = windowScene.windows.first?.rootViewController {
                   rootVC.present(activityController, animated: true, completion: nil)
               }
           }
       }
       
       // 复制文本内容到剪贴板的函数
       func copyTextToClipboard() {
           UIPasteboard.general.string = self.text
           showCopiedAlert = true // 复制成功后显示提示框
       }
}

struct RoosterUsView_Previews:PreviewProvider {
    static var previews: some View {
        RoosterUsView()
    }
}

