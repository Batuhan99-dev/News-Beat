//
//  NewsTableViewCell.swift
//  News Beat
//
//  Created by Batuhan Yılmaz on 10.03.2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var newsImage: UIImageView!
    
    @IBOutlet weak var newsContent: UILabel!
    
    @IBOutlet weak var newsAuthor: UILabel!
    
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}

