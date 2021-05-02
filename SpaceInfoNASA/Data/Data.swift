//
//  Data.swift
//  SpaceInfoNASA
//
//  Created by Алексей Сергейцев on 5/2/21.
//

import Foundation

struct NasaJson: Decodable {
    let copyright: String?
    let date: String?
    let explanation: String?
    let hdurl: String?
    let media_type: String?
    let service_version: String?
    let title: String?
    let url: String?
}
