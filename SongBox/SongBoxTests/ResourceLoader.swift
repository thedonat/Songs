//
//  ResourceLoader.swift
//  SongBoxTests
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation
import SongBoxAPI

class ResourceLoader {
    
    enum SongResource: String {
        case song1
        case song2
        case song3
    }
    
    static func loadMovie(resource: SongResource) throws -> Song {
        let bundle = Bundle.test
        let url =  bundle.url(forResource: resource.rawValue, withExtension: "json")!
        let data = try Data(contentsOf: url)
        let movie =  try JSONDecoder().decode(Song.self, from: data)
        return movie
    }
}

private extension Bundle {
    class Dummy { }
    static let test = Bundle(for: Dummy.self)
}
