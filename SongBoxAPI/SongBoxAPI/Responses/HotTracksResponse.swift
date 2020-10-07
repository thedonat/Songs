//
//  HotTracksResponse.swift
//  SongBoxAPI
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public struct HotTracksResponse: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case feed
    }
    
    private enum FeedCodingKeys: String, CodingKey {
        case results
    }
    
    public let results: [Song]
    
    init(results: [Song]) {
        self.results = results
    }
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let feedContrainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
        self.results = try feedContrainer.decode([Song].self, forKey: .results)
    }
}
