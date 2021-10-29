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
    override func viewDidLoad() {
        super.viewDidLoad()
        //        articleimage.image =  UIImage.init(named: "AppIcon")
        if image == "AppIcon"{
            articleimage.image =  UIImage.init(named: "ionnetimes")
            articleimage.contentMode = .scaleAspectFit
        }else{
            articleimage.load(urlString: "\(image)")
            articleimage.contentMode = .scaleAspectFit
        }
        
        
        lastupdate.text="the last updated for the article is : \(updated)"
        
        articlekey.text = "the writer use this key in his article: \(adx_keywords) "
        acticletitle.text = "\(titletext)"
        acticlebyname.text="\(byname)"
        acticleabstract.text="\(abstract)"
        
        
    }
    
    
    
    
    
    
    
    
}
