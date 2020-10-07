//
//  SongListViewController.swift
//  SongBox
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit
import SongBoxAPI

final class SongListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    private var songs: [Song] = []
    
    var viewModel: SongListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadSongs()
        tableView.register(UINib(nibName: "SongListTableViewCell", bundle: nil), forCellReuseIdentifier: "SongListCell")
    }
}

extension SongListViewController: SongListViewModelDelegate {
    func handleViewModelOutput(_ output: SongListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            DispatchQueue.main.async {
                self.title = title
            }
        case .showSongList(let song):
            self.songs = song
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension SongListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongListCell", for: indexPath) as! SongListTableViewCell
        let song = songs[indexPath.row]
        cell.setView(image: song.image, name: song.name, artistName: song.artistName)
        return cell
    }
    
}

extension SongListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
