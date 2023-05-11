//
//  DatabaseProtocol.swift
//  Crate
//
//  Created by JD Chiang on 11/5/2023.
//

import Foundation

/**Sets out what can be done to the database.**/
enum DatabaseChange {
    case add
    case remove
    case update
}

enum ListenerType {
    case user
    case review
    case list
    case album
    case all
}

protocol DatabaseListener: AnyObject {
    var listenerType: ListenerType {get set}
    func onUserChange(change: DatabaseChange, user: User)
    func onReviewChange(change: DatabaseChange, review: Review)
    func onListChange(change: DatabaseChange, list: [Album])
}

protocol DatabasePro
