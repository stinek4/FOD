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
    @ObservedObject var viewModel: ViewModel = ViewModel()
    

    let layout = [
        GridItem(.flexible(minimum: 100)),
        GridItem(.flexible(minimum: 100))
    ]
    
    let layout2 = [
        GridItem(.adaptive(minimum: 20, maximum: 80))
    ]
    
    
    var body: some View{
        let gridIcons = ["pawprint","pawprint.fill","heart","bag"]

        NavigationView{
            TabView {
            
// MARK: HOME
                VStack{
                    ScrollView{
                        VStack{
                            Image("fod_logo")
                                .resizable()
                                .frame(width: 100, height: 100, alignment: .center)
                                .padding(.top, -40)
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
                }
                    
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                 }.background(Color("HighlightBackgroundColor"))
                    
// MARK: HUND
                VStack{
                    ScrollView{
                        Text("Hundeavdelingen")
                            .font(.system(size: 30).bold())
                            .accessibilityAddTraits(.isHeader)
                            .foregroundColor(Color("AccentColor"))
                    
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(dataService.dogs, id: \.self){ dog in
                                    NavigationLink(destination: DogView()){
                                        VStack{
                                                
                                            WebImage(url: URL(string: dog.img))
                                                .resizable()
                                                .scaledToFill()
                                                .padding(.trailing, 4)
                                                .frame(width: 250, height: 320)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                                .shadow(color: Color("ShadowColor"), radius: 5, x: 0, y: 5)
                                                .padding(.leading, 20)
                                                .padding(.trailing, 20)
                                                    
                                            Text(dog.name)
                                                .font(.system(size: 26).bold())
                                                .foregroundColor(Color("BackgroundColor"))
                                                .shadow(color: Color("ShadowColor"), radius: 5, x: 0, y: 5)
                                                .offset(x: -70, y: -55)
                                        }
                                    }
                                }
                            }
                        }
                        
                        Text("Reserverte hunder")
                            .font(.system(size: 20).bold())
                            .foregroundColor(Color("AccentColor"))
                        
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(viewModel.dummyListOfDogs, id: \.self){ dog in
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
                            }.frame(height: 170, alignment: .center)
                        }
                    }
                }

                .tabItem {
                    Image(systemName: "pawprint")
                    Text("Hund")
                }
                .background(Color("HighlightBackgroundColor"))
                    
// MARK: KATT

                VStack{
                    ScrollView{
                        Text("Katteavdelingen")
                            .font(.system(size: 30).bold())
                            .accessibilityAddTraits(.isHeader)
                            .foregroundColor(Color("AccentColor"))
                    
                        ScrollView(.horizontal){
                            
                            HStack{
                                ForEach(dataService.cats, id: \.self){ cat in
                                    
                                    NavigationLink(destination: CatView()){
                                        VStack{
                                            WebImage(url: URL(string: cat.img))
                                                .resizable()
                                                .scaledToFill()
                                                .padding(.trailing, 4)
                                                .frame(width: 250, height: 320)
                                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                                .shadow(color: Color("ShadowColor"), radius: 5, x: 0, y: 5)
                                                .padding(.leading, 20)
                                                .padding(.trailing, 20)
                                            Text(cat.name)
                                                .font(.system(size: 26).bold())
                                                .foregroundColor(Color("BackgroundColor"))
                                                .shadow(color: Color("ShadowColor"), radius: 5, x: 0, y: 5)
                                                .offset(x: -70, y: -55)
                                        }
                                    }
                                }
                            }
                        }
                        
                        Text("Reserverte katter")
                            .font(.system(size: 20).bold())
                            .foregroundColor(Color("AccentColor"))
                        
                        ScrollView(.horizontal){
                            HStack{
                                ForEach(viewModel.dummyListOfCats, id: \.self){ cat in
                                    WebImage(url: URL(string: cat))
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
                            }.frame(height: 170, alignment: .center)
                        }
                    }
                }
                
              .tabItem {
                Image(systemName: "pawprint")
                Text("Katt")
               }.background(Color("HighlightBackgroundColor"))
            
            }.background(Color("BackgroundColor"))
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}
