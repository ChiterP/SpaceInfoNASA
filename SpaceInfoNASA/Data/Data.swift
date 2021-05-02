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
    let hdurl: String?
    let title: String?
}
