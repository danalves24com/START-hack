//
//  BubbleView.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI
import SpriteKit
import Magnetic

struct BubbleView: UIViewControllerRepresentable {
    
    final class Coordinator: NSObject {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    
    func makeUIViewController(context: Context) -> BubbleVC {
        return BubbleVC()
    }


    func updateUIViewController(_ uiViewController: BubbleVC, context: Context) {}
}


protocol BubbleProtocol {
    
    func addNode(with name: String, image: UIImage?)
    func updateNode(with name: String, count: CGFloat)
    func deleteNode(with name: String)
}


class BubbleVC: UIViewController {
    
    var magneticView: MagneticView?
    var magnetic: Magnetic?
    
    
    override func viewDidLoad() {
        let magneticView = MagneticView(frame: self.view.bounds)
        magnetic = magneticView.magnetic
        view.addSubview(magneticView)
        view.backgroundColor = .clear
        magnetic?.backgroundColor = .clear
        magneticView.backgroundColor = .clear
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for i in 0..<12 {
            addNode(with: "\(i)")
        }
    }
}


extension BubbleVC: BubbleProtocol {
    
    func addNode(with name: String, image: UIImage? = nil) {
        var node: Node
        
        if let image = image {
            node = ImageNode(text: name, image: image, color: .gray, radius: 45)
        } else {
            let color = UIColor(CTRandom.generateRandomColor())
            node = Node(text: name, image: nil, color: color, radius: 45)
        }
        
        node.fontName = "Montserrat-Medium"
        node.fontSize = 18
        node.name = name
        magnetic?.addChild(node)
    }
    
    
    func updateNode(with name: String, count: CGFloat) {
        let node = magnetic?.childNode(withName: name)
        let scale = min(1.0 + count/10.0, 2)
        node?.setScale(scale)
    }
    
    
    func deleteNode(with name: String) {
        let node = magnetic?.childNode(withName: name)
        node?.removeFromParent()
    }
}


class ImageNode: Node {
    override var image: UIImage? {
        didSet {
            texture = image.map { SKTexture(image: $0) }
        }
    }
    override func selectedAnimation() {}
    override func deselectedAnimation() {}
}
