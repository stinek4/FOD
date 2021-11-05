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

struct Cat: Identifiable, Codable, Hashable{
    let id: Int
    let img: String
    let name: String
    let desc: String
    let outside: String
    let color: String
    let age: Int
    let gender: String

}
