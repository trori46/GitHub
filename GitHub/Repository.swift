//
//  Repository.swift
//  GitHub
//
//  Created by Viktoriia Rohozhyna on 2/21/18.
//  Copyright © 2018 Viktoriia Rohozhyna. All rights reserved.
//

import Foundation


struct Repository: Decodable {
    let name: String?
    let description: String?
    let html_url: String?
    let forks_count: Int?
    let stargazers_count: Int?
    let tags_url: String?
}

struct Tag: Decodable {
    let name: String?
}

