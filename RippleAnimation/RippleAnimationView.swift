//
//  RippleAnimationView.swift
//  RippleAnimation
//
//  Created by fuyoufang on 2021/9/22.
//

import UIKit

class RippleAnimationView: UIView {
    
    let replicatorLayer = CAReplicatorLayer()
    
    let animationLayer: CALayer = {
        let layer = CALayer()
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(red: 255 / 255.0, green: 216 / 255.0, blue: 87 / 255.0, alpha: 0.5).cgColor
        return layer
    }()
    
    var duration: Float = 3
    let repeatCount = 3
    var multiple: CGFloat = 1.423
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.addSublayer(replicatorLayer)
        animationLayer.add(createAnimationGroup(), forKey: "key")
        
        replicatorLayer.instanceCount = repeatCount
        replicatorLayer.instanceDelay = CFTimeInterval(duration / Float(repeatCount))
        replicatorLayer.addSublayer(animationLayer)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        replicatorLayer.frame = bounds
        replicatorLayer.cornerRadius = replicatorLayer.bounds.size.height / 2
        animationLayer.frame = replicatorLayer.bounds
        animationLayer.cornerRadius = animationLayer.bounds.size.height / 2
    }
    
    func createAnimationGroup() -> CAAnimationGroup {
        let animationGroup = CAAnimationGroup()
        
        animationGroup.beginTime = CACurrentMediaTime()
        animationGroup.duration = 3
        animationGroup.repeatCount = HUGE
        animationGroup.isRemovedOnCompletion = false
        animationGroup.animations =
            [
                createScaleAnimation(),
                createBackgroundColorAnimation(),
                createBorderColorAnimation()
            ]
        return animationGroup
    }

    func createScaleAnimation() -> CABasicAnimation {
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1
        scaleAnimation.toValue = multiple
        //scaleAnimation.duration = 3
        //scaleAnimation.repeatCount = HUGE // 重复次数设置为无限
        return scaleAnimation
    }
    


    // 使用关键帧动画，使得颜色动画不要那么的线性变化
    func createBackgroundColorAnimation() -> CAKeyframeAnimation {
        let backgroundColorAnimation = CAKeyframeAnimation()
        
        backgroundColorAnimation.keyPath = "backgroundColor"
        backgroundColorAnimation.values =
            [
                UIColor(red: 255 / 255.0, green: 216 / 255.0, blue: 87 / 255.0, alpha: 0.5).cgColor,
                UIColor(red: 255 / 255.0, green: 231 / 255.0, blue: 152 / 255.0, alpha: 0.5).cgColor,
                UIColor(red: 255 / 255.0, green: 241 / 255.0, blue: 197 / 255.0, alpha: 0.5).cgColor,
                UIColor(red: 255 / 255.0, green: 241 / 255.0, blue: 197 / 255.0, alpha: 0).cgColor,
            ]
        backgroundColorAnimation.keyTimes = [0.3, 0.6, 0.9, 1]
        return backgroundColorAnimation
    }
    
    func createBorderColorAnimation() -> CAKeyframeAnimation {
        let borderColorAnimation = CAKeyframeAnimation()
        
        borderColorAnimation.keyPath = "borderColor"
        borderColorAnimation.values =
            [
                UIColor(red: 255 / 255.0, green: 216 / 255.0, blue: 87 / 255.0, alpha: 0.5).cgColor,
                UIColor(red: 255 / 255.0, green: 231 / 255.0, blue: 152 / 255.0, alpha: 0.5).cgColor,
                UIColor(red: 255 / 255.0, green: 241 / 255.0, blue: 197 / 255.0, alpha: 0.5).cgColor,
                UIColor(red: 255 / 255.0, green: 241 / 255.0, blue: 197 / 255.0, alpha: 0).cgColor,
            ]
            borderColorAnimation.keyTimes = [0.3, 0.6, 0.9, 1]
        return borderColorAnimation;
    }

}
