//
//  RepositoryMock.swift
//  SearchHubAppTests
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation

func makeRepositoryMock(id: Int) -> Repository {
    Repository(
        id: id,
        name: "Cats",
        fullName: "eddy/Cats",
        owner: Repository.Owner(
            login: "eddy", id: 1,
            avatarUrl: URL(string: "https://www.pngkit.com/png/detail/911-9115516_avatar-icon-deadpool.png")!,
            url: ""
        ),
        private: false,
        description: "Pizza is love, pizza is life, lorem ipsum is not long enough, tratata",
        fork: false,
        htmlUrl: URL(string: "http://apple.com")!,
        createdAt: Date(),
        updatedAt: Date(),
        pushedAt: Date(),
        stargazersCount: 17,
        watchersCount: 28,
        language: "Swift",
        forksCount: 0,
        watchers: 2,
        archived: false
    )
}
