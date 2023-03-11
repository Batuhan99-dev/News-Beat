//
//  NewsHomePageTableViewController.swift
//  News Beat
//
//  Created by Batuhan Yılmaz on 10.03.2023.
//

import UIKit

class NewsHomePageTableViewController: UITableViewController {
    
    
    @IBOutlet weak var detailsTittle: UILabel!
    
    
    @IBOutlet weak var detailImage: UIImageView!
    
    
    @IBOutlet weak var detailsContent: UILabel!
    
    var newsContent:ArticlesData = ArticlesData(author: "", title: "", urlToİmage: "", content: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailsTittle.text = newsContent.title
        if newsContent.urlToİmage != nil {
            let url = URL(string: newsContent.urlToİmage!)
//                newsImage.dowloadImage(from: url!)
//                newsImage.contentMode = .scaleToFill
        } else {
            print("Error2")
        }
        detailsContent.text = newsContent.content
    }

 
}
