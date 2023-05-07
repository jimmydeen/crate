//
//  SimpleAlbumData.swift
//  Crate
//
//  Created by JD Chiang on 2/5/2023.
//

import Foundation
//

import UIKit

struct Artist: Decodable {
    var id: String
    var name: String
}

struct Image: Decodable {
    var url: String
}
class SimpleAlbumData: NSObject, Decodable {
    var spotifyId: String
    var coverURL: String?
    var name: String
    var href: String
    var artistNames: String?
    
    
    
    private enum RootKeys: String, CodingKey {
        
        case spotifyId = "id"
        case images
        case name
        case artists
        case href
        
    }
    
//    private enum ImageKeys: String, CodingKey {
//        case coverURL = "url"
//    }
//
    private enum ArtistKeys: String, CodingKey {
        case artistNames = "name"
    }

    
    required init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootKeys.self)
//        let imageContainer = try rootContainer.nestedContainer(keyedBy: ImageKeys.self, forKey: .images)
//        let artistContainer = try? rootContainer.nestedContainer(keyedBy: ArtistKeys.self, forKey: .
        if let artistArray = try? rootContainer.decode([Artist].self, forKey: .artists){
            var artistNamesArray: [String] = []
            for artist in artistArray {
                artistNamesArray.append(artist.name)
            }
            artistNames = artistNamesArray.joined(separator: ", ")
        }
        
        spotifyId = try rootContainer.decode(String.self, forKey: .spotifyId)
        
        href = try rootContainer.decode(String.self, forKey: .href)
        name = try rootContainer.decode(String.self, forKey: .name)
 
        coverURL = try rootContainer.decode([Image].self, forKey: .images).last?.url
//        let imageArray = try rootContainer.decode([Image].self, forKey: .images)
//        if let URL = imageArray.last?.url {
//            coverURL = URL
//        }
        
//        if let imageArray = try? rootContainer.decode([Image].self, forKey: .images){
//           coverURL = imageArray.last?.url
//        }
//
        
        
        
        
        
        
        
        
        
        
    }
}
