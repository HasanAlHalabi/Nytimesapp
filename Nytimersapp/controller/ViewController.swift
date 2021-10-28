//
//  ViewController.swift
//  Nytimersapp
//
//  Created by hasan al halabi on 26/10/2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {
    var imageurlstring :String = " "
    var posts = [Post]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title="Ny Time Most Popular Article"
        
        tableView.dataSource=self
        tableView.delegate = self
       
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessageCell1")
        // Do any additional setup after loading the view.
        tableView.separatorColor = UIColor.darkGray
        tableView.separatorInset = .zero
        fetchData()
        
    }
    
 
    func fetchData() {
           if let url = URL(string: "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=An55tTl23wCgXd2jASDZIxvdYT55fhI7") {
               let session = URLSession(configuration: .default)
               let task = session.dataTask(with: url) { (data, response, error) in
                   if error == nil {
                       let decoder = JSONDecoder()
                       if let safeData = data {
                           do {
                               let result = try decoder.decode(Results.self, from: safeData)
                               
                               DispatchQueue.main.async {
                                   
                                   self.posts = result.results
                             
                                   self.tableView.reloadData()
       
                               
                               }
                               
                           } catch {
                               print("it a error here \(error)")
                           }
                       }
                   }
               }
               task.resume()
           }
       }


}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell1") as! MessageCell
        
//        let imageurl = URL(string: self.posts[indexPath.row].media[indexPath.row].metadata[indexPath.row].url)
//        let data1 = try? Data(contentsOf: imageurl!)
         let mediaclass = self.posts[indexPath.row].media
        if mediaclass.isEmpty{
            cell.imagev.image = UIImage.init(named: "AppIcon")
            cell.titleLable.text=self.posts[indexPath.row].title
            cell.ByName.text=self.posts[indexPath.row].byline
            cell.DateText.text=self.posts[indexPath.row].published_date
        }else{
            cell.imagev.load(urlString: self.posts[indexPath.row].media[0].metadata[0].url )
            
            cell.titleLable.text=self.posts[indexPath.row].title
            cell.ByName.text=self.posts[indexPath.row].byline
            cell.DateText.text=self.posts[indexPath.row].published_date
        }
      
       
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.posts.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 133
    }

}

