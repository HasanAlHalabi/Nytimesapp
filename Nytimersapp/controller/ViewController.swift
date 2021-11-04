//
//  ViewController.swift
//  Nytimersapp
//
//  Created by hasan al halabi on 26/10/2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {
    var imageurlstring :String = " "
    let detailsSegueId = "GotoDetails"
    var posts : [MVVMmodule] = []
    var selectedArticle: MVVMmodule!
     var networkManager = ApiCaller()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        fetchData()
        super.viewDidLoad()
        navigationItem.title="Ny Time Most Popular Article"
        
        tableView.dataSource=self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "MessageCell1")
        // Do any additional setup after loading the view.
        tableView.separatorColor = UIColor.darkGray
        tableView.separatorInset = .zero
       
        
    }
    
    // MARK: Datafetch
    

    
    
    
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
                               
                                self.posts = result.results.map{MVVMmodule( mvvmModule : $0)}
                                
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
    // MARK: tableview controll
extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageCell1") as! MessageCell
        
        
        
        cell.articleViewModel = posts[indexPath.row]
//            cell.titleLable.text=self.posts[indexPath.row].title
//            cell.ByName.text=self.posts[indexPath.row].byline
//            cell.DateText.text=self.posts[indexPath.row].published_date
//        cell.imagev.load(urlString: self.imageurlstring)
           // cell.imagev.load(urlString: self.posts[indexPath.row].media[0].metadata[0].url )
         
       

        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.posts.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 133
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArticle = posts[indexPath.row]
        performSegue(withIdentifier: detailsSegueId, sender: nil)
        self.tableView.deselectRow(at: indexPath, animated: true)
//        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailView")as! DetailsViewController

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == detailsSegueId {
            let detailsVC = segue.destination as! DetailsViewController
            detailsVC.articleViewModel = selectedArticle
        }
    }
}

