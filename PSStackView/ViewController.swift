//
//  ViewController.swift
//  PSStackView
//
//  Created by Peter Steele on 7/28/17.
//  Copyright © 2017 peteyP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let colors : [UIColor] = [.clear, .green, .blue, .purple, .black, .orange, .yellow, .magenta, .red]
    let emojis : [UIImage] = [#imageLiteral(resourceName: "emoji5"), #imageLiteral(resourceName: "emoji4"), #imageLiteral(resourceName: "emoji3"), #imageLiteral(resourceName: "emoji2"), #imageLiteral(resourceName: "emoji1")]
    var backgroundColorIndex = 0
    var backgroundBorderColorIndex = 0
    var emojiIndex = 0

    @IBOutlet weak var customizableStackView: PSStackView!
    @IBOutlet weak var paddingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        backgroundColorIndex = (backgroundColorIndex + 1) % colors.count
        customizableStackView.backgroundViewColor = colors[backgroundColorIndex]
    }

    @IBAction func changeBackgroundBorderColor(_ sender: UIButton) {
        backgroundBorderColorIndex = (backgroundBorderColorIndex + 1) % colors.count
        customizableStackView.backgroundBorderColor = colors[backgroundBorderColorIndex]
    }
    
    @IBAction func backgroundAlphaChanged(_ sender: UISlider) {
        customizableStackView.backgroundAlpha = CGFloat(sender.value)
    }
    
    @IBAction func backgroundBorderWidthChanged(_ sender: UISlider) {
        customizableStackView.backgroundBorderWidth = CGFloat(sender.value)
    }

    @IBAction func backgroundBorderRadiusChanged(_ sender: UISlider) {
        customizableStackView.backgroundCornerRadius = CGFloat(sender.value)
    }
    
    @IBAction func paddingChanged(_ sender: UISlider) {
        customizableStackView.padding = CGFloat(sender.value)
    }

    
    @IBAction func addEmojiPressed(_ sender: UIButton) {
        emojiIndex = (emojiIndex + 1) % emojis.count
        let emojiImageView = UIImageView(image: emojis[emojiIndex])
        self.customizableStackView.addArrangedSubview(emojiImageView)
        emojiImageView.isHidden = true
        UIView.animate(withDuration: 0.3) {
            emojiImageView.isHidden = false
        }
    }
    
    @IBAction func removeEmojiPressed(_ sender: UIButton) {
        if customizableStackView.arrangedSubviews.count > 1 {
            let last = self.customizableStackView.arrangedSubviews.last
            UIView.animate(withDuration: 0.3, animations: {
                last?.isHidden = true
            }, completion: { _ in
                last?.removeFromSuperview()
            })
        }
    }
}

