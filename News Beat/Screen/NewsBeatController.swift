//
//  ViewController.swift
//  News Beat
//
//  Created by Batuhan Yılmaz on 8.03.2023.
//

import UIKit

class NewsBeatController: UIViewController {
    var articleList = [ArticlesData]()
    //    var apıCall = ApıCall()
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        fetchRequest()
        
    }
    public func fetchRequest() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=0a666dc01ad44a7bba8f0c5358c79c73")
        let taskData = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error Occured While Accessing data with url")
                return
            }
            var newFullList:NewsData?
            do{
                newFullList = try JSONDecoder().decode(NewsData.self, from: data)
            } catch {
                print("Error Occured While Decoding Json into swift structure \(error)")
            }
            self.articleList = newFullList!.articles
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        taskData.resume()
    }
}

extension UIImageView{
    
    func dowloadImage(from url: URL){
        contentMode = .scaleToFill
        let dataTask = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 150,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                  let data = data, error == nil,
                  let image = UIImage(data: data)
            else
            {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        })
        dataTask.resume()
    }
}
extension NewsBeatController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath)
        as! NewsTableViewCell
        if articleList[indexPath.row].author != nil {
            cell.newsAuthor.text = "\(articleList[indexPath.row].author!)"
        } else {
            cell.newsAuthor.text = "Author None"
        }
        //        cell.newsContent.text = articleList[indexPath.row].content
        if articleList[indexPath.row].author != nil {
            cell.newsContent.text = "\(articleList[indexPath.row].title)"
        }
        else {
            print("error")
        }
        
        if articleList[indexPath.row].urlToİmage != nil {
            let url = URL(string: articleList[indexPath.row].urlToİmage!)
            cell.newsImage.dowloadImage(from: url!)
            cell.newsImage.contentMode = .scaleToFill
            
        } else {
            print("Error image")
        }
        return cell
    }
    
    
}

