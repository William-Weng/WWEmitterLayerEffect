//
//  Constant.swift
//  WWEmitterLayerEffect
//
//  Created by William.Weng on 2026/1/2.
//

import UIKit

public extension WWEmitterLayerEffect {
    
    /// Emitter效果
    enum EffectType {
        case snowFlake                          // 下雪
        case firework(_ subBirthRate: Float)    // 煙火
    }
}
