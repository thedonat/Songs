//
//  Song.swift
//  SongBoxAPI
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation

public struct Song: Decodable, Equatable {
    public let name: String
    public let artistName: String
    public let image: String
    public let genres: [Genre]
    
    public enum CodingKeys: String, CodingKey {
        case name
        case artistName
        case image = "artworkUrl100"
        case genres
    }
}

public struct Genre: Decodable, Equatable {
   public let name: String
}
