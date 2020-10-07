//
//  SongBoxAPITests.swift
//  SongBoxAPITests
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import XCTest
@testable import SongBoxAPI

class SongTests: XCTestCase {
    
    func testParsing() throws {
        let bundle = Bundle(for: SongTests.self)
        let url =  bundle.url(forResource: "song", withExtension: "json")!
        let data = try Data(contentsOf: url)
        let song = try JSONDecoder().decode(Song.self, from: data)
        
        XCTAssertEqual(song.artistName, "Jawsh 685, Jason Derulo & BTS")
        XCTAssertEqual(song.genres.count, 3)
        XCTAssertEqual(song.genres.first?.name, "Pop")
        XCTAssertEqual(song.name, "Savage Love (Laxed - Siren Beat) [BTS Remix]")
        
    }
}
