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
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(view, at: 0)
        view.pin(to: self)
        return view
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
            backgroundView.add(padding: padding, to: self)
        }
    }
    
}

public extension UIView {
    public func pin(to view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topAnchor.constraint(equalTo: view.topAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    public func add(padding: CGFloat, to view: UIView) {
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -padding),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: padding),
            topAnchor.constraint(equalTo: view.topAnchor, constant: -padding),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: padding)
        ])
    }
}
