//
//  MockWebService.swift
//  SongBoxTests
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

@testable import SongBoxAPI

final class MockWebService: WebServiceProtocol {
    var songs: [Song] = []

    func fetchSongs(url: String, completion: @escaping (Result<HotTracksResponse, NetworkError>) -> Void) {
        completion(.success(HotTracksResponse(results: songs)))
    }
}
