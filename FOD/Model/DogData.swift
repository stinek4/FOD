//
//  Dog.swift
//  FOD
//
//  Created by Stine Marie Vørner on 03/11/2021.
//

import Foundation

struct DogData: Codable {
    let dogs: [Dog]
}
    
struct Dog: Identifiable, Codable{
    let id: Int
    let img: String
    let name: String
    let desc: String
    let breed: String
    let color: String
    let age: Int
    let gender: String
}
