//
//  ViewController.swift
//  RatingBarWithSlider
//
//  Created by Raj on 05/06/17.
//  Copyright © 2017 Raj. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var cosmosViewFull: CosmosView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var ratingSlider: UISlider!
    private let startRating:Float = 3.7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cosmosViewFull.didTouchCosmos = didTouchCosmos
        cosmosViewFull.didFinishTouchingCosmos = didFinishTouchingCosmos
        ratingSlider.value = startRating //3.7 slider
        updateRating()
    }
    
    private func updateRating() {
        let value = Double(ratingSlider.value)
        cosmosViewFull.rating = value
        self.ratingLabel.text = ViewController.formatValue(value)
    }
    @IBAction func onSliderChanged(_ sender: UISlider) {
        updateRating()
    }
    private class func formatValue(_ value: Double) -> String {
        return String(format: "%.2f", value)
    }
    
    private func didTouchCosmos(_ rating: Double) {
        ratingSlider.value = Float(rating)
        ratingLabel.text = ViewController.formatValue(rating)
        ratingLabel.textColor = UIColor(red: 133/255, green: 116/255, blue: 154/255, alpha: 1)
    }
    
    private func didFinishTouchingCosmos(_ rating: Double) {
        ratingSlider.value = Float(rating)
        self.ratingLabel.text = ViewController.formatValue(rating)
        ratingLabel.textColor = UIColor(red: 183/255, green: 186/255, blue: 204/255, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


