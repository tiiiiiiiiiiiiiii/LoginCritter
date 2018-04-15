//
//  Mouth.swift
//  LoginCritter
//
//  Created by Christopher Goldsby on 4/15/18.
//  Copyright © 2018 Christopher Goldsby. All rights reserved.
//

import UIKit

final class Mouth: UIImageView, CritterAnimatable {
    
    convenience init() {
        self.init(image: UIImage.Critter.mouthClosed)
        frame = CGRect(x: 15.6, y: 27, width: 26.6, height: 7.3)
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    // MARK: - CritterAnimatable

    func currentState() -> SavedState {
        let currentState = layer.transform

        return {
            self.layer.transform = currentState
            self.layer.bounds = CGRect(x: 0, y: 0, width: 26.6, height: 13.7)
            self.layer.contents = UIImage.Critter.mouthHalf.cgImage
        }
    }

    func applyInactiveState() {
        layer.transform = .identity

        layer.bounds = CGRect(x: 0, y: 0, width: 26.6, height: 7.3)
        layer.contents = UIImage.Critter.mouthClosed.cgImage
    }
    
    func applyActiveStartState() {
        let p1 = CGPoint(x: 15.5, y: 24.6)
        let p2 = CGPoint(x: 14.9, y: 22.1)
        
        layer.transform = CATransform3D
            .identity
            .translate(.x, by: p2.x - p1.x)
            .translate(.y, by: p2.y - p1.y)

        layer.bounds = CGRect(x: 0, y: 0, width: 26.6, height: 13.7)
        layer.contents = UIImage.Critter.mouthHalf.cgImage
    }
    
    func applyActiveEndState() {
        let p1 = CGPoint(x: 15.5, y: 24.6)
        let p2 = CGPoint(x: 14.9, y: 22.1)
        
        layer.transform = CATransform3D
            .identity
            .translate(.x, by: -(p2.x - p1.x))
            .translate(.y, by: p2.y - p1.y)
    }
}