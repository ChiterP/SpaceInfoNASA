//
//  ShowViewController.swift
//  SpaceInfoNASA
//
//  Created by Алексей Сергейцев on 5/2/21.
//

import UIKit

class ShowViewController: UIViewController {
    
    private var nasaJson: NasaJson?
    private var urlImage = ""
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var viewImage: UIImageView!
    @IBOutlet weak var explanatLb: UILabel!
    @IBOutlet weak var dateLb: UILabel!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = false
        
        fetchData(from: URLS.nasaapi.rawValue)
    }
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fetchData(from: url) { nasaJson in
            self.nasaJson = nasaJson
            self.urlImage = nasaJson.url!
            guard let imageData = ImageManager.shared.fetchImage(from: self.urlImage) else { return }
            DispatchQueue.main.async {
                self.viewImage.image = UIImage(data: imageData)
                self.activityIndicator.hidesWhenStopped = true
                self.activityIndicator.stopAnimating()
            }
            self.setupView()
        }
    }
    private func setupView() {
        titleLb.text = nasaJson?.title
        explanatLb.text = nasaJson?.explanation
        dateLb.text = nasaJson?.date
    }
}
