//
//  SongListContracts.swift
//  SongBox
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import SongBoxAPI

protocol SongListViewModelProtocol { //view controllerin istekleri
    var delegate: SongListViewModelDelegate? { get set }
    func loadSongs()
    func selectSong(at index: Int)
}

protocol SongListViewModelDelegate: class { //view modelden donen outputlar
    func handleViewModelOutput(_ output: SongListViewModelOutput)
}

enum SongListViewModelOutput: Equatable { //view modelin outputlarini tasarliyoruz.
    case updateTitle(String)
    case showSongList(result: [Song])
}
