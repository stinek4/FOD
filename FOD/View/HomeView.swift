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
    
//    var dummyListOfImgs = ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1.00xw:0.669xh;0,0.190xh&resize=1200:*","https://www.thesprucepets.com/thmb/sfuyyLvyUx636_Oq3Fw5_mt-PIc=/3760x2820/smart/filters:no_upscale()/adorable-white-pomeranian-puppy-spitz-921029690-5c8be25d46e0fb000172effe.jpg"]
    
    let gridData = Array(1...4).map{ "Item \($0)"}
    
    let layout = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))

    ]
    
    var body: some View{

        TabView {
            
// MARK: HOME
            VStack{
                HStack{
                    ScrollView(.horizontal, showsIndicators: true){
                        GeometryReader { geometry in
                            ImageCarouselView(numberOfImages: 4) {
                                Image("balto")
                                    .resizable()
                                    .scaledToFill()

                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                Image("minda")
                                    .resizable()
                                    .scaledToFill()

                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                Image("kira")
                                    .resizable()
                                    .scaledToFill()
 
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                Image("puffen")
                                    .resizable()
                                    .scaledToFill()

                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    
                                
                            }
                        }
                        .frame(width: 370, height: 280, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    }
                    .padding(10)
                    .shadow(color: Color("ShadowColor"), radius: 5, x: 0, y: 5)
                }
                LazyVGrid(columns: layout, spacing: 10){
                    ForEach(gridData, id: \.self) { item in
                        
                        VStack{
 
                        Button{

                        }label:{
                            Image("minda")
                                .resizable()
                                .frame(width: 180, height: 140, alignment: .center)
                                .scaledToFit()
                                .cornerRadius(20)
                                .shadow(color: Color("ShadowColor"), radius: 5, x: 1, y: 5)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                    }
                }
                .padding(10)
            }
            
             .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
             }.background(Color("HighlightBackGroundColor"))
            
// MARK: HUND
            
           Text("The content of the second view")
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
