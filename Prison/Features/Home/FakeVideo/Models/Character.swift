//
//  Character.swift
//  Prison
//
//  Created by umaxsoft on 24/6/25.
//


import Foundation

struct Character: Identifiable, Codable {
    let id: String
    let name: String
    let avatar: String
    let video: String
    let isHot: Bool?
}
