//
//  CollectionData.swift
//  Crate
//
//  Created by JD Chiang on 23/4/2023.
//

import UIKit



class CollectionData: NSObject, Decodable {
    
    private enum Rootkeys: String, CodingKey {
        case tracks
    }
    
    private enum CodingKeys: String, CodingKey {
        case albums = "items"
    }
    
    var albums: [AlbumData]?
}
