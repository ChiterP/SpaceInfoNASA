//
//  Data.swift
//  SpaceInfoNASA
//
//  Created by Алексей Сергейцев on 5/2/21.
//

import Foundation

struct NasaJson: Decodable {
    let date: String?
    let explanation: String?
    let url: String?
    let title: String?
    let image: String?
}

enum URLS: String {
    case nasaapi = "https://api.nasa.gov/planetary/apod?api_key=BZAsfifDGpBcH5byUPkp5n0wCuz381mu1zJ8CHHZ"
}
