//
//  VideoCell.swift
//  Upskill_List
//
//  Created by Natasha Radika on 24/05/25.
//

import UIKit

class VideoCell: UITableViewCell {
    // buat custom cell
    var videoImageView = UIImageView()
    var videoTitleLabel = UILabel()
    var videoSubtitleLabel = UILabel()
    // do setup ui here
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(videoImageView)
        addSubview(videoTitleLabel)
        addSubview(videoSubtitleLabel)
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
    
    func set(video: Video) {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
        videoSubtitleLabel.text = video.subtitle
    }
    
    func configureImageView() {
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        videoTitleLabel.numberOfLines = 0
        videoTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configureSubtitleLabel() {
        videoSubtitleLabel.numberOfLines = 0
        videoTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true
    }
    
    func setTitleLabelConstraints() {
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        videoTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20).isActive = true
        videoTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        // has to be negative
        videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
    
    func setSubtitleLabelConstraints() {
        videoSubtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        videoSubtitleLabel.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor).isActive = true
        videoSubtitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 20).isActive = true
        videoSubtitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        videoSubtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }
}
