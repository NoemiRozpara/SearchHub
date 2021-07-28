//
//  SearchEndpoint.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation

struct Owner: Codable {
    let login: String
    let id: Int
    let avatarUrl: String?
    let gravatarId: String?
    let url: String
}

struct Repository: Identifiable, Codable {
    let id: String
    let name: String
    let fullName: String
    let owner: Owner
    let `private`: Bool
    let htmlUrl: String
    let description: String
    let fork: Bool
    let url: String
    let createdAt: Date
    let updatedAt: Date
    let pushedAt: Date
    let stargazersCount: Int
    let watchersCount: Int
    let language: String
    let forksCount: Int
    let watchers: Int
    let archived: Bool
}

struct Response: Codable {
    var total_count: Int
    var incomplete_results: Bool
    var items: [Repository]
}
