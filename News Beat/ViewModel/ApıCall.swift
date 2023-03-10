//
//  ApıCall.swift
//  News Beat
//
//  Created by Batuhan Yılmaz on 10.03.2023.
//

import Foundation
import UIKit


final class ApıCall {
    let newsBeatController = NewsBeatController()
    var articlesList =  [ArticlesData]()

     func fetchData(){
        print("Başarılı")

        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=0a666dc01ad44a7bba8f0c5358c79c73")
        let dataTask = URLSession.shared.dataTask(with: url!) { [weak self] data, response, error in
            guard let self = self, let data = data else {
                print("Error fetching data")
                return
            }

            do {
                let newFullList = try JSONDecoder().decode(NewsData.self, from: data)
                self.articlesList = newFullList.articles
            } catch {
                print("Error decoding data: \(error)")
            }
            DispatchQueue.main.async {
                self.newsBeatController.tableView.reloadData()
            }
        }

        dataTask.resume()

    }
}
    
    extension UIImageView {
        func downloadImage(from url: URL) {
            contentMode = .scaleToFill

            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self,
                      let response = response as? HTTPURLResponse,
                      response.statusCode == 200,
                      let mimeType = response.mimeType,
                      mimeType.hasPrefix("image"),
                      let data = data,
                      error == nil,
                      let image = UIImage(data: data)
                else {
                    return
                }

                DispatchQueue.main.async {
                    self.image = image
                }
            }

            task.resume()
        }
    }
    
extension UIViewController: UITableViewDelegate, UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let apiCall = ApıCall()
        return apiCall.articlesList.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let apiCall = ApıCall()

        let cell = tableView.dequeueReusableCell(withIdentifier: "News", for: indexPath) as! NewsTableViewCell
        if apiCall.articlesList[indexPath.row].author != nil {
            cell.newsAuthor.text = apiCall.articlesList[indexPath.row].author
        } else {
            cell.newsAuthor.text = "No Author Available"
        }
        cell.newsContent.text = apiCall.articlesList[indexPath.row].title
        if apiCall.articlesList[indexPath.row].urlToİmage != nil {
            let url = URL(string: apiCall.articlesList[indexPath.row].urlToİmage!)
            cell.newsImage.downloadImage(from: url!)
            cell.newsImage.contentMode = .scaleAspectFit
        } else {
            print("image dosent load")
        }
        return cell
    }
}
    

    
    
    

