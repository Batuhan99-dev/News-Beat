//
//  ViewController.swift
//  News Beat
//
//  Created by Batuhan Yılmaz on 8.03.2023.
//

import UIKit

class NewsBeatController: UIViewController {
    
  
    var serviceData = ApıCall()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
           
    }
    //extension UIViewController: UITableViewDelegate, UITableViewDataSource {
    //
    //    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    //        let apiCall = ApıCall()
    //        return apiCall.articlesList.count
    //    }
    //
    //    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let apiCall = ApıCall()
    //
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath) as! NewsTableViewCell
    //        if apiCall.articlesList[indexPath.row].author != nil {
    //            cell.newsAuthor.text = apiCall.articlesList[indexPath.row].author
    //        } else {
    //            cell.newsAuthor.text = "No Author Available"
    //        }
    //        cell.newsContent.text = apiCall.articlesList[indexPath.row].title
    //        if apiCall.articlesList[indexPath.row].urlToİmage != nil {
    //            let url = URL(string: apiCall.articlesList[indexPath.row].urlToİmage!)
    //            cell.newsImage.downloadImage(from: url!)
    //            cell.newsImage.contentMode = .scaleAspectFit
    //        } else {
    //            print("image dosent load")
    //        }
    //        return cell
    //    }
    //    func updateArticlesList(_ newList: [ArticlesData]) {
    //           articlesList = newList
    //           tableView.reloadData()
    //       }
    //
    }

