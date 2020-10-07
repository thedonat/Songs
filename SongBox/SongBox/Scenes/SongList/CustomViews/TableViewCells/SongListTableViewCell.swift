//
//  SongListTableViewCell.swift
//  SongBox
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

class SongListTableViewCell: UITableViewCell {
    
    
    @IBOutlet private weak var songImageView: UIImageView!
    @IBOutlet weak var songNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setView(image: String, name: String, artistName: String) {
        songNameLabel.text = name
        artistNameLabel.text = artistName
    }
}
