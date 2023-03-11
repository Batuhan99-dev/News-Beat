import Foundation



//final class ApıCall {
//    let newsBeatController = NewsBeatController()
//    var articleList = [ArticlesData]()
//    
//    public func fetchRequest() {
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=0a666dc01ad44a7bba8f0c5358c79c73")
//        let taskData = URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//            guard let data = data, error == nil else {
//                print("Error Occured While Accessing data with url")
//                return
//            }
//            var newFullList:NewsData?
//            do{
//                newFullList = try JSONDecoder().decode(NewsData.self, from: data)
//            } catch {
//                print("Error Occured While Decoding Json into swift structure \(error)")
//            }
//            self.articleList = newFullList!.articles
//            DispatchQueue.main.async {
//                self.newsBeatController.tableView.reloadData()
//            }
//        })
//        taskData.resume()
//    }
//    
//
//}
