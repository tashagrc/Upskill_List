//
//  VideoListViewController.swift
//  Upskill_List
//
//  Created by Natasha Radika on 24/05/25.
//

import UIKit

class MovieListViewController: UIViewController {
    var tableView = UITableView()
    var movies: [Movie] = []
    
    struct Cells {
        static let movieCell = "MoviesCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        movies = fetchData()
        configureTableView()
        
        Task {
            await test()
        }
    }
    
    func test() async {
        let url = URL(string: "https://api.themoviedb.org/3/discover/movie")!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
          URLQueryItem(name: "include_adult", value: "false"),
          URLQueryItem(name: "include_video", value: "false"),
          URLQueryItem(name: "language", value: "en-US"),
          URLQueryItem(name: "page", value: "1"),
          URLQueryItem(name: "sort_by", value: "popularity.desc"),
        ]
        components.queryItems = components.queryItems.map { $0 + queryItems } ?? queryItems

        var request = URLRequest(url: components.url!)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
          "accept": "application/json",
          "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmMjA1MzcyNjUzNzVhNmE3Yzg3N2NkMzQ4NGU2ZDA4NCIsIm5iZiI6MTc0ODE3MjM4OS4xNTUsInN1YiI6IjY4MzJmZTY1YzQzNTU4MDdkMzAzNmZkYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.pNWLFrgxXQGqbix3e0AKxx4Xlxnj1ubeaNPhcBuB5EU"
        ]

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            print(String(decoding: data, as: UTF8.self))
        } catch {
            print("❌ Request failed: \(error.localizedDescription)")
        }
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        // set delegates
        setTableViewDelegates()
        // set row height
        tableView.rowHeight = 100 // currently static
        // register cells
        // tells the table view what kind of cell to create
        tableView.register(MovieCell.self, forCellReuseIdentifier: Cells.movieCell)
        // set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        // delegate protocol pattern
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = movies[indexPath.row]
        let detailVC = MovieDetailViewController(video: selectedItem)
        navigationController?.pushViewController(detailVC, animated: false)
    }
}

extension MovieListViewController: UITableViewDataSource {
    // how many rows do you want
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // create the actual cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // reuse or create cell with that type
        // cast because we want to access function in VideoCell
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.movieCell) as! MovieCell
        cell.set(movie: movies[indexPath.row])
        return cell
    }
}

extension MovieListViewController {
    func fetchData() -> [Movie] {
        return []
    }
}
