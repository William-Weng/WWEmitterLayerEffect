//
//  ViewController.swift
//  Example
//
//  Created by William.Weng on 2026/1/2.
//

import UIKit
import WWEmitterLayerEffect

final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        demo()
    }
    
    func demo() {
        let layer = WWEmitterLayerEffect.shared.maker(with: .snowFlake, on: view, image: .firework, birthRate: 10, lifetime: 10, color: .white)
        // let layer = WWEmitterLayerEffect.shared.maker(with: .firework(2000), on: view, image: .firework, birthRate: 1, lifetime: 10, color: .systemRed)
        view.layer.addSublayer(layer)
    }
}

