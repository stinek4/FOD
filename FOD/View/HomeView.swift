//
//  File.swift
//  FOD
//
//  Created by Stine Marie Vørner on 26/10/2021.
//

import Foundation
import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct HomeView: View{
    
    @ObservedObject var dataService: DataService = DataService()
    
    var dummyListOfImgs = ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1.00xw:0.669xh;0,0.190xh&resize=1200:*","https://www.thesprucepets.com/thmb/sfuyyLvyUx636_Oq3Fw5_mt-PIc=/3760x2820/smart/filters:no_upscale()/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg", "https://post.healthline.com/wp-content/uploads/2020/08/3180-Pug_green_grass-732x549-thumbnail-732x549.jpg", "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F47%2F2021%2F03%2F25%2Fdoberman-pinscher-red-collar-1100812121-2000.jpg"]
    
    //let gridData = Array(1...4).map{ "Item \($0)"}


    
    let layout = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))

    ]
    
    let layout2 = [
        GridItem(.adaptive(minimum: 20, maximum: 80))
    ]
    
    
    var body: some View{
        
        let gridIcons = ["pawprint","pawprint.fill","heart","bag"]

//        let gridIcon = [
//            {"name":"Hunder" ,"icon":"pawprint"},
//            {"name":"Katter" ,"icon":"pawprint.fill"},
//            {"name":"Bidra", "icon":"heart"},
//            {"name":"Butikk", "icon": "bag"}]
            

        
        TabView {
            
// MARK: HOME
            VStack{
                VStack{
                    Image("fod_logo")
                        .resizable()
                        .frame(width: 90, height: 90, alignment: .center)
                }.frame(width: 368, height: 50, alignment: .center)
                HStack{
                    ScrollView(.horizontal, showsIndicators: true){
                        GeometryReader { geometry in
                            ImageCarouselView(numberOfImages: 4) {
                                Image("balto")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                
                                Image("minda")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                
                                Image("kira")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                
                                Image("puffen")
                                    .resizable()
                                    .scaledToFit    ()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                            }
                        }
                        .frame(width: 370, height: 240, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    }
                    .padding(10)
                    .shadow(color: Color("ShadowColor"), radius: 5, x: 0, y: 5)
                }
                LazyVGrid(columns: layout, spacing: 10){
                    ForEach(gridIcons, id: \.self) { item in
                        Button{
                            
                        }label:{
                            Image(systemName: "\(item)")
                                .resizable()
                                .frame(width: 70, height: 70, alignment: .center)
                                .foregroundColor(Color("HighlightBackgroundColor"))
                        }
                        .frame(width: 170, height: 130, alignment: .center)
                        .background(Color("TemporaryGray"))
                        .buttonStyle(PlainButtonStyle())
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .shadow(color: Color("ShadowColor"), radius: 5, x: 0, y: 5)
    
                    }
                }
                .padding(10)
            }
            
             .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
             }.background(Color("HighlightBackGroundColor"))
            
// MARK: HUND
            VStack{
                Text("Hundeavdelingen")
                    .font(.system(size: 30).bold())
                    .accessibilityAddTraits(.isHeader)
                    .foregroundColor(Color("AccentColor"))
                
                
                //HStack med filtrering
                
                ScrollView(.horizontal){
                    HStack{
                        //LazyVGrid(columns: layout2, spacing: 2){
                        ForEach(dummyListOfImgs, id: \.self){ dog in

                            Button{
                                
                            }label:{
                                VStack{
                                
                            WebImage(url: URL(string: dog))
                                .resizable()
                                .scaledToFill()
                                .padding(.trailing, 4)
                                .frame(width: 250, height: 320)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(color: Color("ShadowColor"), radius: 5, x: 0, y: 5)
                                .padding(.leading, 20)
                                .padding(.trailing, 20)
                                    
                            Text("Name")
                                .font(.system(size: 26).bold())
                                .foregroundColor(Color("BackgroundColor"))
                                .shadow(color: Color("ShadowColor"), radius: 5, x: 0, y: 5)
                                .offset(x: -70, y: -55)
                                
                            }
                            .buttonStyle(PlainButtonStyle())
                            }}
                       // }
                    }
                }
                Text("Reserverte hunder")
                    .font(.system(size: 20).bold())
                    .foregroundColor(Color("AccentColor"))
                ScrollView(.horizontal){
                    HStack{
                        
                        ForEach(dummyListOfImgs, id: \.self){ dog in
                            WebImage(url: URL(string: dog))
                                .resizable()
                                .scaledToFill()
                                .padding(.trailing, 4)
                                .frame(width: 140, height: 140)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .shadow(color: Color("ShadowColor"), radius: 5, x: 0, y: 5)
                                .padding(.leading, 20)
                            
                            Label{
                                Text("Reservert")
                                    .font(.system(size: 10))
                                    .offset(x: -70, y: -55)
                                    .padding(.trailing, -45)
                                    .foregroundColor(Color("BackgroundColor"))

                            }icon:{
                                Capsule().frame(width: 55, height: 16)
                                    .foregroundColor(Color("SecondaryColor"))
                                    .offset(x: -56, y: -55)
                                    .padding(.trailing, -45)
                            }
                        }
                    }
                }

                
            }
           
             
                
                
                .tabItem {
                Image(systemName: "pawprint")
                Text("Hund")
              }.background(Color("HighlightBackGroundColor"))
            
// MARK: KATT
            
            Text("The content of the third view")
              .tabItem {
                Image(systemName: "pawprint")
                Text("Katt")
               }.background(Color("HighlightBackGroundColor"))
        
        }
        
        
    }
}


// FOREACH
//ForEach(dummyListOfImgs, id: \.self){ dog in
//    WebImage(url: URL(string: dog))
//        .resizable()
//        .scaledToFill()
//        .padding(.trailing, 4)
//        .frame(width: geometry.size.width, height: geometry.size.height)
//}
