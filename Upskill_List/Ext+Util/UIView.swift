//
//  UIView.swift
//  Upskill_List
//
//  Created by Natasha Radika on 24/05/25.
//

import UIKit

extension UIView {
    func pin(to superView: UIView) {
        // want to set the constraint myself
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}
