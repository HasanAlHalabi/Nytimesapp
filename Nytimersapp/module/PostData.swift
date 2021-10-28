//
//  PostData.swift
//  Nytimersapp
//
//  Created by hasan al halabi on 26/10/2021.
//

import Foundation
struct Results: Decodable {
    let results: [Post]
    
}
struct MediaMetaData: Codable {
    let url: String
    let format: String
    let height: Int
    let width: Int
}


//struct PostMedia: Codable {
//
//    let type: String
//    let subtype: String
//    let caption: String
//    let copyright: String
//    let approved_for_syndication: Bool
//    enum CodingKeys : String,CodingKey {
//        case metadata = "metadata"
//    }
//
//    init(from decoder: Decoder) throws {
//
//    }
//
//
//}


enum Constants {
    
    static let media = "media"
        static let mediaMetadata = "media-metadata"
    static let url = "url"
    static let multimedia12 = "multimedia"
    
}
enum mediaMetadata:Decodable{
        case url, format, height
    }
struct metadataurl :Decodable{
    let url :String
}
struct Post: Decodable, Identifiable {
    var id: String {
           return String(asset_id)
       }
    let asset_id: Int
    let title: String
    let url: String?
    let byline : String
    let published_date : String
   let media:[Postmetadata]
    
}

struct Postmetadata:Decodable{
   
    let metadata:[metadataurl]
    enum CodingKeys: String, CodingKey {
        case  metadata = "media-metadata"
    }
}
