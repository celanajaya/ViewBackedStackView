//
//  PSStackView.swift
//  PSStackView
//
//  Created by Peter Steele on 7/28/17.
//  Copyright © 2017 peteyP. All rights reserved.
//

import UIKit

class PSStackView: UIStackView {
    
    private lazy var backgroundView: UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(background, at: 0)
        background.pinned(to: self)
        return background
    }()
    
    @IBInspectable
    var backgroundViewColor: UIColor = .clear {
        didSet {
            backgroundView.backgroundColor = backgroundViewColor
        }
    }
    
    @IBInspectable
    open var backgroundCornerRadius: CGFloat = 0 {
        didSet {
            backgroundView.layer.cornerRadius = backgroundCornerRadius
        }
    }
    
    @IBInspectable
    open var backgroundBorderColor: UIColor = .clear {
        didSet {
            backgroundView.layer.borderColor = backgroundBorderColor.cgColor
        }
    }
    
    @IBInspectable
    open var backgroundBorderWidth: CGFloat = 0 {
        didSet {
            backgroundView.layer.borderWidth = backgroundBorderWidth
        }
    }
    
    @IBInspectable
    open var backgroundAlpha: CGFloat = 1 {
        didSet {
            backgroundView.alpha = backgroundAlpha
        }
    }
    
    @IBInspectable
    open var padding: CGFloat = 0 {
        didSet {
            // remove any constraints related to the background view
            let backgroundViewConstraints = constraints.filter {$0.firstItem as? UIView == backgroundView ||
                                                                $0.secondItem as? UIView == backgroundView}
            removeConstraints(backgroundViewConstraints)
            backgroundView.add(padding: padding, to: self)
        }
    }
    
}

fileprivate extension UIView {
    func pinned(to view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func add(padding: CGFloat, to view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -padding),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding),
            topAnchor.constraint(equalTo: view.topAnchor, constant: -padding),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: padding)
        ])
    }
}
