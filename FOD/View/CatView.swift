//
//  CatView.swift
//  FOD
//
//  Created by Stine Marie Vørner on 26/10/2021.
//

import Foundation
import SwiftUI

struct CatView: View{
    
    @ObservedObject var dataService: DataService = DataService()
    @ObservedObject var viewModel: ViewModel = ViewModel()
    
    var body: some View{
            VStack{
                Image("first_cat")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 390, height: 300, alignment: .center)
                VStack{
                    ScrollView{
                        Text("Navn")
                            .font(.system(size: 30).bold())
                            .foregroundColor(Color("AccentColor"))
                            .padding(.top, 20)
                    HStack{
                        VStack{
                            Capsule()
                                .fill(Color("SecondaryBackgroundColor"))
                                .overlay(
                                    VStack{
                                        Text("Utekatt")
                                            .font(.system(size: 16).bold())
                                            .foregroundColor(Color("AccentColor"))
                                        Text("Ja")
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
                                    Text("1 år")
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
                                    Text("Hunn")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color("AccentColor"))
                                    })
                        }
                        .frame(width: 70, height: 40)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(10)
                    }
                        Text("Soline er en skikkelig kosekatt som aller helst ligger i fanget eller mellom fostermor og -far i sofaen for å få mest mulig kos. Hun er også veldig leken. Hun jakter på laser, garn og hårstrikker i leiligheten, og er på sitt blideste når hun får en ny pappeske å leke med. Soline kom i fosterhjem i mars 2021. Da var hun drektig, og nokså sky. Sakte, men sikkert har hun skjønt at mennesker er flinke til å gi kos. Hun er fortsatt litt skvetten og skeptisk til fremmede, men gi henne litt tid så blir hun din beste venn.")
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

struct CatView_Previews: PreviewProvider{
    static var previews: some View{
        CatView()
    }
}
