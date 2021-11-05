//
//  DataService.swift
//  FOD
//
//  Created by Stine Marie Vørner on 03/11/2021.
//

import Foundation

class DataService: ObservableObject{
    
    @Published var dogs: [Dog] = []
    @Published var cats: [Cat] = []
    @Published var number: Int = 132
    
    init(){
         //   readLocalCats(forName: "CatData")
            getTheCats()
          // parseCatJson(jsonData: data)
  //          getLocalDogs()
    }
    

    func getTheCats(){
        print("who let the cats out")
        if let url = Bundle.main.url(forResource: "cat", withExtension: "json"),
           let data = try? Data(contentsOf: url){
            let decoder = JSONDecoder()
            if let jsonCat = try? decoder.decode(CatData.self, from: data){
                self.cats = jsonCat.cats
                print(jsonCat.cats)
                print(cats)
            }
        }
    }

}
//    func getLocalDogs(){
//       print("dogs")
//        if let url = Bundle.main.url(forResource: "dog", withExtension: "json"),
//        let data =  try? Data(contentsOf: url){
//            let decoder = JSONDecoder()
//            if let jsonDogData = try? decoder.decode(DogData.self, from: data){
//                self.dogs = jsonDogData.dogs
//                print(jsonDogData)
//                print(jsonDogData.dogs)
//            }
//
//        }
//    }
    
//
//    private func loadJson(from URLString, urlString: String, completion: @escaping (Result<Data, Error>) -> Void){
//        if let url = URL(string: urlString){
//            let urlSession = URLSession(configuration: .default).dataTask(with: url){ (data, response, errror) in
//                if let error = error {
//                    completion(.failure(error))
//                }
//                if let data = data {
//                    completion(.success(data))
//                }
//            }
//            urlSession.resume()
//        }
//    }


//    func getLocalCats(){
//        print("cats function runing")
//        guard let url = Bundle.main.url(forResource: "cat", withExtension: "json") else {return}
//
//        let request = URLRequest(url: url)
//        let session = URLSession.shared
//        session.dataTask(with: request){ data, response, error in
//            if let error = error {
//                print(error)
//                return
//            }
//            guard let data = data else {
//                return
//            }
//            do{
//                let jsonData = try? JSONDecoder().decode(CatData.self, from: data)
//                DispatchQueue.main.async {[weak self] in
//                    self?.number = jsonData!.number
//                    self?.cats = jsonData!.cats
//                        print(jsonData!.number)
//
//                    }
//
//                }
//            }
//        }




//MARK: attempt 1

//func readLocalCats(forName name: String) -> Data?{
//    print("get local cats is running")
//    do{
//        if let filePath = Bundle.main.path(forResource: "cat", ofType: "json"){
//            let fileURL = URL(fileURLWithPath: filePath)
//            let data = try? Data(contentsOf: fileURL)
//        return data
//        }
//    }
//    return nil
//}
//
//func parseCatJson(jsonData: Data) -> CatData? {
//    do {
//        let decodedData = try JSONDecoder().decode(CatData.self, from: jsonData)
//        return decodedData
//    } catch {
//        print("error")
//    }
//    return nil
//}
//
//func getTheCats(){
//    let jsonData = readLocalCats(forName: "CatData")
//
//    if let data = jsonData{
//        if let OdaDataObject = parseCatJson(jsonData: data){
//            print("cats: \(OdaDataObject.cats)")
//            print("this runs")
//        }
//    }
//}
