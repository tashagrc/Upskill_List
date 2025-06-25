//
//  VideoCell.swift
//  Upskill_List
//
//  Created by Natasha Radika on 24/05/25.
//

import UIKit

class MovieCell: UITableViewCell {
    // buat custom cell
    var movieImageView = UIImageView()
    var movieTitleLabel = UILabel()
    var movieSubtitleLabel = UILabel()
    // do setup ui here
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(movieImageView)
        addSubview(movieTitleLabel)
        addSubview(movieSubtitleLabel)
        configureImageView()
        configureTitleLabel()
        configureSubtitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
        setSubtitleLabelConstraints()
    }
    
    // dont use this init
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(movie: Movie) {
        // ToDo change it to image
        movieImageView.image = movie.posterPath
        movieTitleLabel.text = movie.title
        movieSubtitleLabel.text = movie.overview
    }
    
    func configureImageView() {
        movieImageView.layer.cornerRadius = 10
        movieImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureSubtitleLabel() {
        movieSubtitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        movieImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        movieImageView.widthAnchor.constraint(equalTo: movieImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleLabelConstraints() {
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20).isActive = true
        movieTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // has to be negative
        movieTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setSubtitleLabelConstraints() {
        movieSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieSubtitleLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor).isActive = true
        movieSubtitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 20).isActive = true
        movieSubtitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        movieSubtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
