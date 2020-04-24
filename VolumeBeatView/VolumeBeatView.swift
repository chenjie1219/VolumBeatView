//
//  VolumeBeatView.swift
//  VolumeBeatView
//
//  Created by Jason on 2020/4/17.
//  Copyright © 2020 Jason. All rights reserved.
//

import UIKit

class VolumeBeatView: UIView {
    
    lazy var barColor = UIColor.red
    
    lazy var barCount = 4
    
    lazy var replicatorLayer:CAReplicatorLayer = {
        
        let layer = CAReplicatorLayer()
        
        layer.bounds = self.bounds
        
        layer.position = CGPoint(x: self.width / 2, y: self.height / 2)
        
        layer.instanceCount = self.barCount
        
        layer.instanceTransform = CATransform3DMakeTranslation(self.width / CGFloat((self.barCount + 1)), 0.0, 0.0)
        
        layer.instanceDelay = 1.0 / Double(self.barCount)
        
        layer.masksToBounds = true
        
        return layer
        
    }()
    
    lazy var bar:CALayer = {
        
        let layer = CALayer()
        
        layer.bounds = CGRect(x: 0, y: 0, width: self.width / 12, height: self.height * 2 / 3)
        
        layer.position = CGPoint(x: self.width / CGFloat(self.barCount + 1), y: self.height * 1.2)
        
        layer.cornerRadius = 2.0
        
        layer.backgroundColor = self.barColor.cgColor
        
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupUI()
    }
    
}


// MARK: - UI
extension VolumeBeatView{
    func setupUI() {
        
        replicatorLayer.addSublayer(bar)
        
        layer.addSublayer(replicatorLayer)
        
    }
}


// MARK: - Method
extension VolumeBeatView{
    
    func starAnimation() {
        
        let move = CABasicAnimation(keyPath: "position.y")
        
        move.toValue = bar.position.y - bar.bounds.height * 2 / 3
        
        move.duration = 0.45
        
        move.autoreverses = true
        
        move.repeatCount = Float.infinity
        
        bar.add(move, forKey: nil)
    }
    
}
