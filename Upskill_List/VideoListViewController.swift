//
//  VideoListViewController.swift
//  Upskill_List
//
//  Created by Natasha Radika on 24/05/25.
//

import UIKit

class VideoListViewController: UIViewController {
    var tableView = UITableView()
    var videos: [Video] = []
    
    struct Cells {
        static let videoCell = "VideoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Videos"
        videos = fetchData()
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        // set delegates
        setTableViewDelegates()
        // set row height
        tableView.rowHeight = 100 // currently static
        // register cells
        // tells the table view what kind of cell to create
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        // set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        // delegate protocol pattern
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension VideoListViewController: UITableViewDelegate {
    
}

extension VideoListViewController: UITableViewDataSource {
    // how many rows do you want
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    // create the actual cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // reuse or create cell with that type
        // cast because we want to access function in VideoCell
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        cell.set(video: videos[indexPath.row])
        return cell
    }
}

extension VideoListViewController {
    func fetchData() -> [Video] {
        var videos: [Video] = []
        for i in 1...15 {
            videos.append(Video(image: UIImage(named: "\(i)"), title: "This is video \(i)"))
        }
        return videos
    }
}
