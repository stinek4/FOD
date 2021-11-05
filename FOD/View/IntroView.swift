//
//  IntroView.swift
//  FOD
//
//  Created by Stine Marie Vørner on 05/11/2021.
//

import Foundation
import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct IntroView: View {
    @ObservedObject var dataService: DataService = DataService()
    
    var body: some View{
        NavigationView{
            VStack{
                VStack{
                    Image("fod_logo")
                        .resizable()
                        .frame(width: 160, height: 160, alignment: .top)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                .frame(width: 150, height: 150, alignment: .center)
                .padding(.top, -130)
                
                VStack{
                    Image("Boxer_Running")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 260, height: 260, alignment: .top)
                        .clipShape(RoundedRectangle(cornerRadius: 360))
                        .shadow(color: Color("ShadowColor"), radius: 8, x: 0, y: 5)
                    
                    Text("Vil du adoptere?")
                        .font(.system(size: 30).bold())
                        .foregroundColor(Color("AccentColor"))
                        .padding(20)
                    
                    Text("Vi har mange hunder og katter som trenger et trygt og godt hjem")
                        .font(.system(size: 20))
                        .foregroundColor(Color("AccentColor"))
                        .padding(20)
                }
                .background(Color("HighlightBackgroundColor"))
                .frame(width: 375, height: 500, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 15))

                NavigationLink(destination: HomeView()){
                    VStack{
                        Text("Neste")
                            .foregroundColor(Color("BackgroundColor"))
                            .font(.system(size: 20).bold())
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .background(Color("AccentColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 360))
                }.navigationBarBackButtonHidden(true)
            }.frame(alignment: .center)
        }
    }
}

struct IntroView_Previews: PreviewProvider{
    static var previews: some View{
        IntroView()
    }
}
