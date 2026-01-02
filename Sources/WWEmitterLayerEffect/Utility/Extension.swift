//
//  Extension.swift
//  WWEmitterLayerEffect
//
//  Created by William.Weng on 2026/1/2.
//

import UIKit
import QuartzCore

// MARK: - CAEmitterLayer (function)
extension CAEmitterLayer {
    
    /// 基本設定
    /// - Parameters:
    ///   - position: 發射的位置 => 畫面x軸中心
    ///   - size: 發射的範圍大小 => 全畫面
    ///   - shape: 發射的方式 => 直線 / 圓形 / 矩型…，官方有數學式計算細節
    /// - Returns: CAEmitterLayer
    func _setting(position: CGPoint, size: CGSize, shape: CAEmitterLayerEmitterShape? = nil) -> Self {
        
        if let shape = shape { self.emitterShape = shape }
        
        self.emitterPosition = position
        self.emitterSize = size
        
        return self
    }
    
    /// 設定發射的樣式
    /// - Parameter shape: 發射樣式
    /// - Returns: CAEmitterLayer
    func _shape(_ shape: CAEmitterLayerEmitterShape?) -> Self {
        if let shape = shape { self.emitterShape = shape }
        return self
    }
    
    /// 設定渲染效果
    /// - Parameter renderMode: 渲染效果
    /// - Returns: CAEmitterLayer
    func _renderMode(_ renderMode: CAEmitterLayerRenderMode?) -> Self {
        if let renderMode = renderMode { self.renderMode = renderMode }
        return self
    }
    
    /// 設定時間間隔
    /// - Parameter offset: 時間間隔
    /// - Returns: CAEmitterLayer
    func _timeOffset(offset: CFTimeInterval?) -> Self {
        if let offset = offset { self.beginTime = CACurrentMediaTime(); self.timeOffset = offset }
        return self
    }
}

// MARK: - CAEmitterCell (function)
extension CAEmitterCell {
    
    /// 基本設定
    /// - Parameters:
    ///   - image: Cell的長相
    ///   - birthRate: 個數 (1/s)
    ///   - lifetime: 存活時間 (s)
    /// - Returns: CAEmitterCell
    func _setting(image: UIImage? = nil, birthRate: Float, lifetime: Float) -> CAEmitterCell {
        
        if let image = image { self.contents = image.cgImage }
        
        self.birthRate = birthRate
        self.lifetime = lifetime

        return self
    }
    
    /// 設定縮放大小
    /// - Parameters:
    ///   - scale: 基本大小倍數 => 0.06
    ///   - range: 倍數大小範圍 => (0.06 - 0.3) ~ (0.06 + 0.3)
    ///   - speed: 大小改變的速度 => -0.02 => 越變越小
    /// - Returns: CAEmitterCell
    func _scale(_ scale: CGFloat, range: CGFloat, speed: CGFloat) -> CAEmitterCell {
        
        self.scale = scale
        self.scaleRange = range
        self.scaleSpeed = speed
        
        return self
    }
    
    /// 設定速度
    /// - Parameters:
    ///   - velocity: 基本速度 => -30
    ///   - range: 速度範圍 => (-30 - 20) ~ (-50 + -20)
    /// - Returns: CAEmitterCell
    func _velocity(_ velocity: CGFloat, range: CGFloat) -> CAEmitterCell {
        
        self.velocity = velocity
        self.velocityRange = range
        
        return self
    }
    
    /// 設定加速度
    /// - Parameters:
    ///   - x: 左右移動的加速度
    ///   - y: 上下移動的加速度
    /// - Returns: CAEmitterCell
    func _acceleration(x: CGFloat, y: CGFloat) -> CAEmitterCell {
        
        self.xAcceleration = x
        self.yAcceleration = y

        return self
    }
    
    /// 設定週期
    /// - Parameters:
    ///   - duration: 週期
    ///   - beginTime: 開始時間
    /// - Returns: CAEmitterCell
    func _duration(_ duration: CFTimeInterval, beginTime: CFTimeInterval) -> CAEmitterCell {
        
        self.beginTime = beginTime
        self.duration = duration
        
        return self
    }
    
    /// 旋轉速度
    /// - Parameters:
    ///   - spin: 旋轉速度 (radians)
    ///   - range: 旋轉速度範圍 => (-0.5 - 1.0) ~ (-0.5 + 1.0)
    /// - Returns: CAEmitterCell
    func _spin(_ spin: CGFloat, range: CGFloat) -> CAEmitterCell {
        
        self.spin = spin
        self.spinRange = range

        return self
    }
    
    /// 設定角度
    /// - Parameters:
    ///   - range: 發射的角度範圍 => 不會單純只是直直的落下
    ///   - latitude: XY平面的發射角度
    ///   - longitude: Z軸方向的發射角度
    /// - Returns: CAEmitterCell
    func _emission(range: CGFloat, latitude: CGFloat, longitude: CGFloat) -> CAEmitterCell {
        
        self.emissionRange = range
        self.emissionLatitude = latitude
        self.emissionLongitude = longitude
        
        return self
    }
    
    /// 設定顏色
    /// - Parameters:
    ///   - color: 顯示的顏色
    ///   - redRange: 顏色的變化範圍 (紅)
    ///   - greenRange: 顏色的變化範圍 (綠)
    ///   - blueRange: 顏色的變化範圍 (監)
    /// - Returns: CAEmitterCell
    func _color(_ color: UIColor? = nil, redRange: Float, greenRange: Float, blueRange: Float) -> CAEmitterCell {
        
        if let color = color { self.color = color.cgColor }
        
        self.redRange = redRange
        self.greenRange = greenRange
        self.blueRange = blueRange
        
        return self
    }
    
    /// 設定透明度
    /// - Parameters:
    ///   - range: 隨機透明度範圍 => 0.75
    ///   - speed: 透明度改變的速度 => -0.15 => 越變越透明
    /// - Returns: CAEmitterCell
    func _alpha(range: Float, speed: Float) -> CAEmitterCell {
        
        self.alphaRange = range
        self.alphaSpeed = speed
        
        return self
    }
}
