//
//  DetailsViewController.swift
//  Nytimersapp
//
//  Created by hasan al halabi on 28/10/2021.
//

import UIKit

class DetailsViewController: UIViewController {
    var titletext : String = ""
    var image  : String = ""
    var abstract : String = ""
    var byname: String = ""
    var url: String = ""
    var adx_keywords: String = ""
    var updated: String = ""
   
    @IBOutlet weak var lastupdate: UILabel!
    @IBOutlet weak var articlekey: UILabel!
    @IBOutlet weak var acticleabstract: UILabel!
    @IBOutlet weak var acticlebyname: UILabel!
    @IBOutlet weak var acticletitle: UILabel!
    @IBOutlet weak var articleimage: UIImageView!
    var articleViewModel: MVVMmodule! 
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        navigationItem.title="Article Details"
        //        articleimage.image =  UIImage.init(named: "AppIcon")
        
       
            
        
        
        articleimage.load(urlString: articleViewModel.imageUrlString ?? "https://1000logos.net/wp-content/uploads/2017/04/Symbol-New-York-Times.png" )
        lastupdate.text="the last updated for the article is : \(articleViewModel.updated)"
        
        articlekey.text = "the writer use this key in his article: \(articleViewModel.adx_keywords) "
        acticletitle.text = "\(articleViewModel.title)"
        acticlebyname.text="\(articleViewModel.byline)"
        acticleabstract.text="\(articleViewModel.abstract)"
        
        
    }
    
    
    
    
    
    
    
    
}
