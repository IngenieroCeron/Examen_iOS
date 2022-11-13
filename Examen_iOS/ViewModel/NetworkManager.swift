//
//  NetworkManager.swift
//  Examen_iOS
//
//  Created by Eduardo Ceron on 12/11/22.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var questionsInfo = [Question]()
    
    func fetchData() {
        if let url = URL(string: "https://s3.amazonaws.com/dev.reports.files/test.json#") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                do{
                    if let jsonData = data {
                        print("tamaño del json \(jsonData)")
                        let decodeData = try JSONDecoder().decode(Results.self, from: jsonData)
                        DispatchQueue.main.async {
                            self.questionsInfo = decodeData.data
                        }
                    }
                } catch{
                    print("Error: \(error)")
                }
            }// urlsession
            .resume()
        }
    }
}
