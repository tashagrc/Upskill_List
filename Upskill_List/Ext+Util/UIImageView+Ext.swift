//
//  UIImageView+Ext.swift
//  Upskill_List
//
//  Created by Natasha Radika on 25/06/25.
//

import Foundation
import UIKit

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            let completeUrl = URL(string: "https://image.tmdb.org/t/p/w500/\(url.absoluteString)")
            if let data = try? Data(contentsOf: completeUrl!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
