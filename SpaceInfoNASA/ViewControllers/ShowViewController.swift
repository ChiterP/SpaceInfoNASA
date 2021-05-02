//
//  ShowViewController.swift
//  SpaceInfoNASA
//
//  Created by Алексей Сергейцев on 5/2/21.
//

import UIKit

class ShowViewController: UIViewController {
    
    private let url = "https://api.nasa.gov/planetary/apod?api_key=BZAsfifDGpBcH5byUPkp5n0wCuz381mu1zJ8CHHZ"
    private var imageUrl = ""
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var viewImageLb: UIImageView!
    @IBOutlet weak var eplanatLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        getDataNasa()
    }
    
    // MARK: - Networking
    private func getDataNasa() {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            do {
                let nasaDescription = try JSONDecoder().decode(NasaJson.self, from: data)
                print(nasaDescription)
                self.imageUrl = nasaDescription.hdurl ?? ""
                self.fetchImage()
    
                DispatchQueue.main.async {
                    self.dateLb.text = nasaDescription.date
                    self.eplanatLb.text = nasaDescription.explanation
                    self.titleLb.text = nasaDescription.title
                }

            } catch let error {
                print(error)
            }
        }.resume()
    }
    
    private func fetchImage() {
        print("fetchImage \(imageUrl)")
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, let response = response else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            print(response)
            guard let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.viewImageLb.image = image
                self.activityIndicator.stopAnimating()
            }
        }.resume()
    }
}
