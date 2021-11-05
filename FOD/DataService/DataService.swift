//
//  DataService.swift
//  FOD
//
//  Created by Stine Marie Vørner on 03/11/2021.
//

import Foundation

class DataService: ObservableObject{
    
    //Arrays set with JSON though CatData/DogData, now available for use in Views
    @Published var dogs: [Dog] = []
    @Published var cats: [Cat] = []
    
    //Initializes JSONdecoder right away
    init(){
        readDogFile()
        readCatFile()
    }

    //Decodes JSON from local file called "cat".
    //Sets jsonCat/jsonDog through CatData/DogData to be @Published var Arrays at the top of this file
    private func readCatFile() {
        if let url = Bundle.main.url(forResource: "cat", withExtension: "json"),
        let data =  try? Data(contentsOf: url){
            let decoder = JSONDecoder()
            if let jsonCat = try? decoder.decode(CatData.self, from: data){
                self.cats = jsonCat.cats
                print(jsonCat)
            }
        }
    }
    
    private func readDogFile(){
        if let url = Bundle.main.url(forResource: "dog", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            let decoder = JSONDecoder()
            if let jsonDog = try? decoder.decode(DogData.self, from: data){
                self.dogs = jsonDog.dogs
                print(jsonDog)
            }
        }
    }
}
