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
            avatarUrl: "",
            gravatarId: "",
            url: ""
        ),
        private: false,
        description: "Pizza is love, pizza is life, lorem ipsum is not long enough, tratata",
        fork: false,
        url: URL(string: "http://apple.com")!,
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
