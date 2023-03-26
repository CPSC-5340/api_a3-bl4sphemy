//
//  IpModel.swift
//  Assignment3
//
//  Created by Brian Rawlins on 3/26/23.
//

import Foundation


struct IpModel : Codable, Identifiable {
    let id : String
    let ip: String
    let hostname: String
    let city: String
    let region: String
    let country: String
    let loc: String
    let org: String
    let postal: String
    let timezone: String
}
