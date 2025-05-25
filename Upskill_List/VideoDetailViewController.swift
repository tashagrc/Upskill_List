//
//  VideoDetailViewController.swift
//  Upskill_List
//
//  Created by Natasha Radika on 24/05/25.
//

import UIKit

class VideoDetailViewController: UIViewController {
    var stackView = UIStackView()
    var video: Video
    let videoImageView = UIImageView()
    var videoTitleLabel = UILabel()
    var videoSubtitleLabel = UILabel()
    
    init(video: Video) {
        self.video = video
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
        videoImageView.contentMode = .scaleAspectFit
        videoImageView.clipsToBounds = true
        videoImageView.image = video.image
        stackView.addArrangedSubview(videoImageView)
        videoImageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    func addVideoTitleLabelToStackView() {
        videoTitleLabel.text = video.title
        videoTitleLabel.numberOfLines = 0
        videoTitleLabel.adjustsFontSizeToFitWidth = true
        stackView.addArrangedSubview(videoTitleLabel)
    }
    
    func addVideoSubtitleLabelToStackView() {
        videoSubtitleLabel.text = video.subtitle
        videoSubtitleLabel.numberOfLines = 0
        videoSubtitleLabel.adjustsFontSizeToFitWidth = true
        stackView.addArrangedSubview(videoSubtitleLabel)
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
