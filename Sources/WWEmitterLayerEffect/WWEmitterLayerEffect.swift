//
//  WWEmitterLayerEffect.swift
//  WWEmitterLayerEffect
//
//  Created by William.Weng on 2026/1/2.
//

import UIKit
import QuartzCore

// MARK: - 雪花 / 煙火效果產生器
open class WWEmitterLayerEffect {
    static public let shared = WWEmitterLayerEffect()
}

// MARK: - 公開函式
public extension WWEmitterLayerEffect {
    
    /// [產生Emitter效果](https://medium.com/彼得潘的-swift-ios-app-開發問題解答集/利用-caemitterlayer-製作-xmas-的下雪動畫-ee5f7cae621e)
    /// - Parameters:
    ///   - effectType: [Emitter效果](https://medium.com/彼得潘的-swift-ios-app-開發教室/ios-app-利用-caemitterlayer-製作動畫-9272bbbe3b4b)
    ///   - view: 在哪個View上顯示
    ///   - image: 雪花圖片
    ///   - birthRate: 產生數量
    ///   - lifetime: 存活時間
    ///   - color: 顏色
    ///   - colorRange: 顏色變動的範圍
    ///   - renderMode: CAEmitterLayerRenderMode
    /// - Returns: CAEmitterLayer
    func maker(with effectType: EffectType, on view: UIView, image: UIImage, birthRate: Float, lifetime: Float, color: UIColor? = nil, colorRange: ColorRange? = nil, renderMode: CAEmitterLayerRenderMode? = nil) -> CAEmitterLayer {
        
        switch effectType {
        case .snowFlake:
            
            let layer = CAEmitterLayer()
                        ._setting(position: CGPoint(x: view.bounds.width / 2.0, y: -50), size: CGSize(width: view.bounds.width, height: 0), shape: .line)
                        ._renderMode(renderMode)
                        ._timeOffset(offset: 10)
            
            let snowFlakeCell = snowFlakeCell(image: image, birthRate: birthRate, lifetime: lifetime, color: color, colorRange: colorRange)
            
            layer.emitterCells = [snowFlakeCell]
            
            return layer

        case .firework(let subBirthRate):
            
            let layer = CAEmitterLayer()
                        ._setting(position: CGPoint(x: view.bounds.width / 2, y: view.bounds.height), size: view.bounds.size)
                        ._renderMode(renderMode)
            
            let fireworkCell = fireworkCell(image: image, birthRate: birthRate, subBirthRate: subBirthRate, lifetime: lifetime, color: color, colorRange: colorRange)
            
            layer.emitterCells = [fireworkCell]
            
            return layer
        }
    }
}

// MARK: - 雪花Cell產生器
private extension WWEmitterLayerEffect {
    
    /// [雪花Cell產生器](https://medium.com/@satindersingh71/smooth-core-animation-snow-effect-3d93417b96b3)
    /// - Parameters:
    ///   - image: 雪花圖片
    ///   - birthRate: 產生數量
    ///   - lifetime: 存活時間
    ///   - color: 顏色
    ///   - colorRange: 顏色變動的範圍
    /// - Returns: CAEmitterCell
    func snowFlakeCell(image: UIImage, birthRate: Float, lifetime: Float, color: UIColor?, colorRange: ColorRange?) -> CAEmitterCell {
        
        let colorRange = colorRange ?? (0, 0, 0)
        
        let cell = CAEmitterCell()._setting(image: image, birthRate: birthRate, lifetime: lifetime)
                                  ._scale(1.0, range: 0.3, speed: -0.02)
                                  ._acceleration(x: 5, y: 30)
                                  ._velocity(-30, range: -20)
                                  ._emission(range: .pi, latitude: .pi, longitude: .pi)
                                  ._spin(-0.5, range: 1.0)
                                  ._color(color, redRange: colorRange.red, greenRange: colorRange.green, blueRange: colorRange.blue)
        return cell
    }
}

// MARK: - 煙火Cell產生器
private extension WWEmitterLayerEffect {

    /// [煙火Cell產生器](https://medium.com/@peteliev/what-do-you-know-about-caemitterlayer-368378d45c2e)
    /// - Parameters:
    ///   - image: 煙火圖片
    ///   - birthRate: 射出產生數量
    ///   - subBirthRate: 爆開產生數量
    ///   - lifetime: 存活時間
    ///   - color: 顏色
    ///   - colorRange: 顏色變動的範圍
    /// - Returns: CAEmitterCell
    func fireworkCell(image: UIImage, birthRate: Float, subBirthRate: Float, lifetime: Float, color: UIColor?, colorRange: ColorRange?) -> CAEmitterCell {
        
        let emitterCell = fireworkEmitterCell(birthRate: birthRate, lifetime: lifetime, color: color, colorRange: colorRange)
        let trailCell = fireworkTrailCell(image: image)
        let fireworkCell = fireworkMainCell(image: image, birthRate: subBirthRate)
        
        emitterCell.emitterCells = [trailCell, fireworkCell]
        
        return emitterCell
    }
    
    /// 煙火Cell容器產生器
    /// - Parameters:
    ///   - birthRate: 產生數量
    ///   - lifetime: 存活時間
    ///   - color: 顏色
    ///   - colorRange: 顏色變動的範圍
    /// - Returns: CAEmitterCell
    func fireworkEmitterCell(birthRate: Float, lifetime: Float, color: UIColor?, colorRange: ColorRange?) -> CAEmitterCell {
        
        let colorRange = colorRange ?? (0.9, 0.9, 0.9)
        
        let cell = CAEmitterCell()._setting(birthRate: birthRate, lifetime: lifetime)
                                  ._color(color, redRange: colorRange.red, greenRange: colorRange.green, blueRange: colorRange.blue)
                                  ._velocity(-300, range: -100)
                                  ._acceleration(x: 0, y: -100)
                                  ._emission(range: CGFloat.pi / 4, latitude: 0, longitude: CGFloat.pi / 2)
                
        return cell
    }
    
    /// 煙火尾巴產生器
    /// - Parameter image: 圖片
    /// - Returns: CAEmitterCell
    func fireworkTrailCell(image: UIImage) -> CAEmitterCell {
        
        let cell = CAEmitterCell()._setting(image: image, birthRate: 45.0, lifetime: 0.5)
                                  ._scale(0.4, range: 0.1, speed: -0.1)
                                  ._acceleration(x: 0, y: 350)
                                  ._velocity(-80, range: 0)
                                  ._emission(range: CGFloat.pi / 8, latitude: 0, longitude: CGFloat.pi * 2)
                                  ._alpha(range: 0, speed: -0.7)
                                  ._duration(1.7, beginTime: 0.01)
        return cell
    }
    
    /// 主要煙火產生器
    /// - Parameters:
    ///   - image: 圖片
    ///   - birthRate: 產生數量
    /// - Returns: CAEmitterCell
    func fireworkMainCell(image: UIImage, birthRate: CFloat) -> CAEmitterCell {
        
        let cell = CAEmitterCell()._setting(image: image, birthRate: birthRate, lifetime: 100)
                                  ._scale(0.6, range: 0, speed: -0.1)
                                  ._velocity(-130, range: 0)
                                  ._acceleration(x: 0, y: 80)
                                  ._spin(2, range: 0)._alpha(range: 0, speed: -0.2)
                                  ._emission(range: CGFloat.pi * 2, latitude: 0, longitude: 0)
                                  ._duration(0.1, beginTime: 1.5)
                
        return cell
    }
}
