//
//  NetworkManager.swift
//  AFSpaceInfoNASA
//
//  Created by Алексей Сергейцев on 5/4/21.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String?, with complition: @escaping (NasaJson) -> Void) {
        guard let stringURL = url else { return }
        guard let url = URL(string: stringURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let nasaJson = try JSONDecoder().decode(NasaJson.self, from: data)
                DispatchQueue.main.async {
                    complition(nasaJson)
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
    
}

class ImageManager {
    static var shared = ImageManager()
    
    private init() {}
    
    func fetchImage(from url: String?) -> Data? {
        guard let stringURL = url else { return nil }
        guard let imageURL = URL(string: stringURL) else { return nil }
        return try? Data(contentsOf: imageURL)
    }
}

