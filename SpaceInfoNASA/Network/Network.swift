////
////  Network.swift
////  SpaceInfoNASA
////
////  Created by Алексей Сергейцев on 5/2/21.
////
//
//import Foundation
//
//
//    // MARK: - Networking
//    func getDataNasa() {
//        guard let url = URL(string: url) else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, _, error) in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            
//            do {
//                let nasaDescription = try JSONDecoder().decode(NasaJson.self, from: data)
//                print(nasaDescription)
//                self.imageUrl = nasaDescription.hdurl!
//                self.fetchImage()
//                DispatchQueue.main.async {
//                    self.dateLb.text = nasaDescription.date!
//                    self.eplanatLb.text = nasaDescription.explanation!
//                    self.titleLb.text = nasaDescription.title!
//                }
//                print("getDataNasa \(self.imageUrl)")
//                
//            } catch let error {
//                self.failedAlert()
//                print(error)
//            }
//        }.resume()
//    }
//    
//    func fetchImage() {
//        print("fetchImage \(imageUrl)")
//        guard let url = URL(string: imageUrl) else { return }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data, let response = response else {
//                print(error?.localizedDescription ?? "No error description")
//                return
//            }
//            guard let image = UIImage(data: data) else { return }
//            
//            DispatchQueue.main.async {
//                self.viewImageLb.image = image
//                self.activityIndicator.stopAnimating()
//            }
//        }.resume()
//    }
//}
