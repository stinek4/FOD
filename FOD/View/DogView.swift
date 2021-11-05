//
//  DogView.swift
//  FOD
//
//  Created by Stine Marie Vørner on 26/10/2021.
//

import Foundation
import SwiftUI
import UIKit
import SDWebImageSwiftUI

struct DogView: View{
    
    @ObservedObject var dataService: DataService = DataService()
    @ObservedObject var viewModel: ViewModel = ViewModel()

    
    var body: some View{
            
        VStack{
            Image("Boxer_Running")
                .resizable()
                .scaledToFill()
                .frame(width: 390, height: 300, alignment: .center)
            VStack{
                ScrollView{
                    Text("Puffen")
                        .font(.system(size: 30).bold())
                        .foregroundColor(Color("AccentColor"))
                        .padding(.top, 20)
                HStack{
                    VStack{
                        Capsule()
                            .fill(Color("SecondaryBackgroundColor"))
                            .overlay(
                                VStack{
                                    Text("Rase")
                                        .font(.system(size: 16).bold())
                                        .foregroundColor(Color("AccentColor"))
                                    Text("Boxer")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color("AccentColor"))
                                })
                    }
                    .frame(width: 60, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(10)
                    
                    VStack{
                        Capsule()
                            .fill(Color("SecondaryBackgroundColor"))
                            .overlay(
                                VStack{
                                Text("Alder")
                                    .font(.system(size: 16).bold())
                                    .foregroundColor(Color("AccentColor"))
                                Text("3 år")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("AccentColor"))
                                })
                    }
                    .frame(width: 70, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(10)
                    
                    VStack{
                        Capsule()
                            .fill(Color("SecondaryBackgroundColor"))
                            .overlay(
                                VStack{
                                Text("Kjønn")
                                    .font(.system(size: 16).bold())
                                    .foregroundColor(Color("AccentColor"))
                                Text("Hann")
                                    .font(.system(size: 14))
                                    .foregroundColor(Color("AccentColor"))
                                })
                    }
                    .frame(width: 70, height: 40)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(10)
                }
                    Text("Puffen er vår store kosebamse! Han er tillitsfull, trofast og en fantastisk kjærlig følgesvenn. Puffen elsker å være ute og er godt pelset for all slags vær. Han har et moderat aktivitetsnivå. Koser seg med skogsturer, lek med annen hund og trives også godt med å ligge i hagen og holde oversikt. Han klarer fint å slappe av alene en arbeidsdag. Han har gode manerer inne og aldri ødelagt noe.")
                        .font(.system(size: 14))
                        .foregroundColor(Color("AccentColor"))
                        .padding(20)
            }
            
            Spacer()
        }
        .background(Color("HighlightBackgroundColor"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .frame(width: 395, height: 300, alignment: .bottom)
        .ignoresSafeArea()
                      
            HStack{
                NavigationLink(destination: HomeView()){
                    VStack{
                        Text("Send interesse skjema")
                            .foregroundColor(Color("BackgroundColor"))
                            .font(.system(size: 20).bold())
                    }
                    .padding(.top, 10)
                    .padding(.bottom, 10)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .background(Color("SecondaryColor"))
                    .clipShape(RoundedRectangle(cornerRadius: 360))
                }
                .padding(.top, 20)
                .frame(alignment: .trailing)
            }
            .frame(width: 390, height: 80, alignment: .bottom)
            .ignoresSafeArea()
        }
    }
}

struct DogView_Previews: PreviewProvider{
    static var previews: some View{
        DogView()
    }
}
