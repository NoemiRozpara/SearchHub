//
//  RepositoryModel.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation

struct Repository: Identifiable, Codable {
    struct Owner: Codable {
        let login: String
        let id: Int
        let avatarUrl: String?
        let gravatarId: String?
        let url: String
    }
    
    let id: Int
    let name: String
    let fullName: String
    let owner: Owner
    let `private`: Bool
    let description: String
    let fork: Bool
    let url: URL
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
