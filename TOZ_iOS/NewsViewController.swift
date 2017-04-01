//
//  NewsViewController.swift
//  TOZ_iOS
//
//  Copyright © 2017 intive. All rights reserved.
//
import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    let newsOperation = NewsOperation()
    var localNewsList = [NewsEntity]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.newsTableView.backgroundColor = Color.Background.primary
        getNews()
    }

}

extension NewsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return localNewsList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: NewsTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "news_cell", for: indexPath) as? NewsTableViewCell)!
        cell.configure(with: localNewsList[indexPath.row])
        return cell

    }

    func getNews() {
        newsOperation.resultCompletion = { result in
            var downloadedNewsList = [NewsEntity]()

            switch result {
            case .success(let newsList):
                for news in newsList {
                    
                    let title = news.title
                    let contents = news.contents
                    let publishDate = news.published
                    let photoURL = news.photoUrl
                    downloadedNewsList.append(NewsEntity(title: title, datePublished: publishDate, content: contents, picture: nil))
                }

            case .failure(let error):
                print ("\(error)")
            }

            DispatchQueue.main.async {
                self.localNewsList = downloadedNewsList
                self.newsTableView.reloadData()
            }
        }
        newsOperation.start()
    }
}

extension NewsViewController: UITableViewDelegate {

}
