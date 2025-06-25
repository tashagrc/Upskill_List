//
//  VideoDetailViewController.swift
//  Upskill_List
//
//  Created by Natasha Radika on 24/05/25.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var stackView = UIStackView()
    var movie: Movie
    let movieImageView = UIImageView()
    var movieTitleLabel = UILabel()
    var movieSubtitleLabel = UILabel()
    
    init(movie: Movie) {
        self.movie = movie
        // have to be after self.video
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureStackView()
        addVideoImageToStackView()
        addVideoTitleLabelToStackView()
        addVideoSubtitleLabelToStackView()
        setStackViewConstraints()
    }
    
    func addVideoImageToStackView() {
        movieImageView.contentMode = .scaleAspectFit
        movieImageView.clipsToBounds = true
        // ToDo load image correctly
        movieImageView.image = UIImage(systemName: "1")
        stackView.addArrangedSubview(movieImageView)
        movieImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func addVideoTitleLabelToStackView() {
        movieTitleLabel.text = movie.title
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        stackView.addArrangedSubview(movieTitleLabel)
    }
    
    func addVideoSubtitleLabelToStackView() {
        movieSubtitleLabel.text = movie.overview
        movieSubtitleLabel.numberOfLines = 0
        movieSubtitleLabel.adjustsFontSizeToFitWidth = true
        stackView.addArrangedSubview(movieSubtitleLabel)
    }
    
    func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 0
        view.addSubview(stackView)
    }
    
    func setStackViewConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}
