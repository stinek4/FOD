//
//  Cat.swift
//  FOD
//
//  Created by Stine Marie Vørner on 03/11/2021.
//

import Foundation

struct CatData: Codable  {
    let cats: [Cat]

}

struct Cat: Identifiable, Codable{
    let id: Int
    let img: String
    let name: String
    let desc: String
    let outOrIn: String
    let color: String
    let age: Int
    let gender: String

}
