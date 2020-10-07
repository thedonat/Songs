//
//  SongBoxTests.swift
//  SongBoxTests
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import XCTest
@testable import SongBox
@testable import SongBoxAPI

class SongBoxTests: XCTestCase {
    
    private var viewModel: SongListViewModel!
    private var view: MockView!
    private var service: MockWebService!

    override func setUpWithError() throws {
        service = MockWebService()
        viewModel = SongListViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
    }

    func testLoad() throws {
        //Given:
        let song1 = try ResourceLoader.loadMovie(resource: .song1)
        let song2 = try ResourceLoader.loadMovie(resource: .song2)
        let song3 = try ResourceLoader.loadMovie(resource: .song3)
        service.songs = [song1, song2, song3]
        
        //When:
        viewModel.loadSongs()
        
        //Then:
        XCTAssertEqual(view.outputs.count, 2)
        
        switch view.outputs[0] {
        case .showSongList(result: _):
            break //SUCCESS
        default:
            XCTFail("First output should be showSongList")
        }
    }
}

private class MockView: SongListViewModelDelegate {
    
    var outputs: [SongListViewModelOutput] = []
    
    func handleViewModelOutput(_ output: SongListViewModelOutput) {
        outputs.append(output)
    }
}
