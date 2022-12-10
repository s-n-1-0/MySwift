//
//  FeedbackView.swift
//  
//
//  Created by Mac10 on 2022/11/30.
//
import SwiftUI

public struct FeedbackView: View {
    public let origin:String
    public let appType:FeedbackApp
    @State private var message = ""
    @State private var isSentAlert = false
    @State private var alertText = ""
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
   public var body: some View {
        ScrollView{
            VStack{
                VStack{
                    HStack(alignment:.bottom,spacing: 0){
                        Image(systemName: "paperplane.fill").font(.caption)
                        Text(localize("Express")).font(.caption)
                        Spacer()
                    }.foregroundColor(Color.blue)
                    HStack{
                        Text(localize("Title")).font(.title2)
                        Spacer()
                    }
                }.padding([.leading,.trailing])
                Divider()
                VStack(alignment:.leading){
                    HStack{
                        Spacer()
                        Image(uiImage: UIImage(named: "AppIcon") ?? UIImage()).frame(width: 100,height: 100).cornerRadius(15)
                        Spacer()
                    }
                    Text(localize("Message")).padding([.top])
                    Text(localize("Message2")).font(.caption)
                    Divider().padding([.bottom])
                    TextEditor(text: $message).overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(UIColor.secondaryLabel), lineWidth: 3)
                    ).frame(minHeight:100).overlay(
                        Group{
                            if message.isEmpty{
                                VStack{
                                    HStack{
                                        Text(localize("EnterRequest")).foregroundColor(Color(UIColor.secondaryLabel))
                                        Spacer()
                                    }
                                    Spacer()
                                }.padding(6)
                            }
                        })
                    if !message.isEmpty{
                        Button(action:{
                            
                            FeedbackRequest(origin, appType).send(message: message, completionHandler: {
                                _,res,error in
                                if error != nil || res == nil{
                                    alertText = localize("SendFailed")
                                    
                                }else{
                                    alertText = localize("Sent")
                                }
                                isSentAlert = true
                                
                            })
                            
                        }){
                            Text(localize("Send")).frame(maxWidth:.infinity).foregroundColor(Color(UIColor.systemBackground)).padding().background(Color(UIColor.label)).cornerRadius(15)
                        }.alert(isPresented: $isSentAlert){
                            Alert(title:Text(alertText),dismissButton: .default(Text(localize("Back")), action: {
                                presentationMode.wrappedValue.dismiss()
                            }))
                        }
                    }
                }.padding([.leading,.trailing])
                Spacer()
            }
        }
    }
    func localize(_ key:String) -> String{
        return ("FeedbackView-" + key).localizedModule
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView(origin: "", appType: .ChikuwaDiary)
    }
}
