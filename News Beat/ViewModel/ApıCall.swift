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
    
    public func fetchData(){
        
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
    public func downloadImage(from url:URL) {
        
    }
}
