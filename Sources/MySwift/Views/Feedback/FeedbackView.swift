//
//  FeedbackView.swift
//  
//
//  Created by Mac10 on 2022/11/30.
//
import SwiftUI

struct FeedbackView: View {
    @State private var message = ""
    var body: some View {
        ScrollView{
            VStack{
                VStack{
                    HStack(alignment:.bottom,spacing: 0){
                        Image(systemName: "paperplane.fill").font(.caption)
                        Text("速達!").font(.caption)
                        Spacer()
                    }.foregroundColor(Color.blue)
                    HStack{
                        Text("開発者へ要望・バグ報告を送る").font(.title2)
                        Spacer()
                    }
                }.padding([.leading,.trailing])
                Divider()
                VStack(alignment:.leading){
                    Text("アプリを利用していて「こういう機能がほしい」や「ここを直して欲しい」などの気づいたことがあればぜひお気軽に↓のフォームからお送りください!\n 改善点が見つかると開発者がとても助かります。").font(.caption).padding([.top])
                    Text("※バグ報告の場合は詳細にお願いします!").font(.caption)
                    TextEditor(text: $message).overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(UIColor.label), lineWidth: 1)
                    ).frame(minHeight:100).overlay(
                        Group{
                            if message.isEmpty{
                                VStack{
                                    HStack{
                                        Text("ここに要望を記入...").foregroundColor(Color(UIColor.secondaryLabel))
                                        Spacer()
                                    }
                                    Spacer()
                                }.padding(6)
                            }
                        })
                    if !message.isEmpty{
                        Button(action:{}){
                            Text("送信").frame(maxWidth:.infinity).foregroundColor(Color(UIColor.systemBackground)).padding().background(Color(UIColor.label)).cornerRadius(15)
                        }
                    }
                }.padding([.leading,.trailing])
                Spacer()
            }
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
