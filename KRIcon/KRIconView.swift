//
//  KRIcon.swift
//
//  Created by Ryunosuke Kirikihira on 2015/09/16.
//  Copyright © 2015年 Ryunosuke Kirikihira. All rights reserved.
//

import UIKit

@IBDesignable
class KRIconView: UIView {
    var iconType :IconType = .TYPE_Add
    @IBInspectable var type :Int = 0 {
        didSet {
            self.iconType = IconType.intToIconType(type)
        }
    }
    @IBInspectable var fillColor :UIColor = UIColor.blackColor()
    @IBInspectable var strokeColor :UIColor = UIColor.blackColor()
    @IBInspectable var lineWidth :CGFloat = 0.0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        let fillColor = self.fillColor
        let strokeColor = self.strokeColor
        let lineWidth = self.lineWidth
        
        fillColor.setFill()
        strokeColor.setStroke()
        
        // Get icon path
        let path = self.iconType.getDrawPath()
        
        path.lineCapStyle = CGLineCap.Square
        path.lineWidth = lineWidth
        
        let wRatio = rect.size.width / 50
        let hRatio = rect.size.height / 50
        let scale = CGAffineTransformMakeScale(wRatio, hRatio)
        path.applyTransform(scale)

        
        path.fill()
        path.stroke()
    }

}
