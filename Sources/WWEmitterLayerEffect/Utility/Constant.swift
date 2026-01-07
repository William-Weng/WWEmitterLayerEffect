//
//  Constant.swift
//  WWEmitterLayerEffect
//
//  Created by William.Weng on 2026/1/2.
//

import UIKit

// MARK: - typealias
public extension WWEmitterLayerEffect {
    
    /// 顏色變動的範圍
    typealias ColorRange = (red: Float, green: Float, blue: Float)
}

// MARK: - enum
public extension WWEmitterLayerEffect {
    
    /// Emitter效果
    enum EffectType {
        case snowFlake                          // 下雪
        case firework(_ subBirthRate: Float)    // 煙火
    }
}
