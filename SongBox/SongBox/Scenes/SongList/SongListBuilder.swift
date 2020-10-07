//
//  SongListBuilder.swift
//  SongBox
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import UIKit

final class SongListBuilder {
    
    //her tarafta import yapmaktansa builder icersinde butun import ve injectionlari yapiyoruz
    static func make() -> SongListViewController {
        let storyboard = UIStoryboard(name: "SongList", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SongListViewController") as! SongListViewController
        viewController.viewModel = SongListViewModel(service: app.service)
        return viewController
    }
}
