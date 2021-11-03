//
//  MVVMViewModule.swift
//  Nytimersapp
//
//  Created by hasan al halabi on 03/11/2021.
//

import Foundation

struct MVVMmodule{
    
    
    let title: String
    let url: String
    let byline : String
    let published_date : String
    let abstract: String
    let adx_keywords : String
    let updated : String
    let imageUrlString: String?
    let thumbnailUrlString: String?
    init (mvvmModule : Post){
        
        title = "\(mvvmModule.title)"
        url =  "\(mvvmModule.url)"
        byline =  "\(mvvmModule.byline)"
        published_date = "\(mvvmModule.published_date)"
     
        abstract = "\(mvvmModule.abstract)"
        adx_keywords = "\(mvvmModule.adx_keywords)"
        updated = "\(mvvmModule.updated)"
        
        let mediaMetaData = mvvmModule.media.first?.metadata
        self.imageUrlString = mediaMetaData?.first?.url
       
        self.thumbnailUrlString = mediaMetaData?.filter{
            $0.format == "Standard Thumbnail"
            }.first?.url
    }
    
 
    
    
}
