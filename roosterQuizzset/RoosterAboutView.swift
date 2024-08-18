//
//  RoosterAboutView.swift
//  roosterQuizzset
//
//  Created by galen on 2024/8/18.
//

import SwiftUI

struct RoosterAboutView:View {
    @State private var text: String = """
       Chickens, scientifically known as Gallus gallus domesticus, are domesticated birds that have been a vital part of human agriculture for thousands of years. Originating from wild jungle fowl in Southeast Asia, chickens have been bred for various purposes, primarily for their meat and eggs. There are hundreds of chicken breeds today, each with unique characteristics suited for specific climates, purposes, or appearances.

       Chickens are omnivores, feeding on a diet that includes seeds, insects, and small animals, making them valuable in controlling pests. They are social animals that live in flocks and exhibit complex behaviors such as pecking orders, where dominance and hierarchy are established within the group.

       Chickens play a significant role in many cultures and are often associated with rural life. They are also important in scientific research, particularly in genetics and developmental biology, due to their relatively short life cycle and ease of breeding. Additionally, chickens contribute to the economy as a major source of protein worldwide.
       """
       
       @State private var showCopiedAlert: Bool = false // 控制复制成功后的提示框显示
       
       var body: some View {
           ZStack {
               // 图像视图，设置透明度
               Image("rooster_bg")
                   .resizable()
                   .scaledToFill()
                   .opacity(0.5)
                   .edgesIgnoringSafeArea(.all)
               VStack {
                   // 文本视图
                   TextEditor(text: $text) // 绑定文本内容
                       .padding(.horizontal, 40)  // 在VStack整体添加水平内边距
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
                   .padding(.bottom, 30)
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
               .opacity(0.8)
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

struct RoosterAboutView_preview: PreviewProvider {
    static var previews: some View {
        RoosterAboutView()
    }
}

