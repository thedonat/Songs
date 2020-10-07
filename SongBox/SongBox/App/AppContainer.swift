//
//  AppContainer.swift
//  SongBox
//
//  Created by Burak Donat on 7.10.2020.
//  Copyright © 2020 Burak Donat. All rights reserved.
//

import Foundation
import SongBoxAPI

let app = AppContainer()

final class AppContainer { //dependency container
    let router = AppRouter()
    let service = NetworkManager()
}
