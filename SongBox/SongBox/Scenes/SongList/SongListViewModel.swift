//
//  SongListViewModel.swift
//  SongBox
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import SongBoxAPI

final class SongListViewModel: SongListViewModelProtocol {
    weak var delegate: SongListViewModelDelegate?
    private let service: WebServiceProtocol
    
    init(service: WebServiceProtocol) {
        self.service = service
    }
    
    func loadSongs() {
        let url = "https://rss.itunes.apple.com/api/v1/us/itunes-music/hot-tracks/all/25/explicit.json"
        service.fetchSongs(url: url) { [weak self] (response: Result<HotTracksResponse, NetworkError>) in
            guard let self = self else { return }
            
            switch response {
            case .success(let result):
                self.delegate?.handleViewModelOutput(.showSongList(result: result.results))
                self.delegate?.handleViewModelOutput(.updateTitle("Songs"))
            case .failure(let error):
                print(error.errorMessage)
            }
        }
    }
    
    func selectSong(at index: Int) {
        //TODO: Implement
    }
}
