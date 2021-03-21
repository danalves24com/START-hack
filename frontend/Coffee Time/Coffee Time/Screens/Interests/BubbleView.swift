//
//  BubbleView.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI
import SpriteKit
import Magnetic
import Combine

struct BubbleView: UIViewControllerRepresentable {
    
    final class Coordinator: NSObject {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
    
    
    func makeUIViewController(context: Context) -> BubbleVC {
        return BubbleVC()
    }


    func updateUIViewController(_ uiViewController: BubbleVC, context: Context) {
        
        
    }
}


protocol BubbleProtocol {
    
    func addNode(with name: String, image: UIImage?)
    func updateNode(with name: String, count: CGFloat)
    func deleteNode(with name: String)
}


class BubbleVC: UIViewController {
    
    var magneticView: MagneticView?
    var magnetic: Magnetic?
    
    var cancallables = Set<AnyCancellable>()
    
    
    override func viewDidLoad() {
        let magneticView = MagneticView(frame: self.view.bounds)
        magnetic = magneticView.magnetic
        view.addSubview(magneticView)
        view.backgroundColor = .clear
        magnetic?.backgroundColor = .clear
        magneticView.backgroundColor = .clear
        
        BubbleNetworkManager.shared.shouldAdd.sink { (name, image) in
            self.addNode(with: name, image: image)
        }
        .store(in: &cancallables)
        
        BubbleNetworkManager.shared.shouldUpdate.sink { (name, count) in
            self.updateNode(with: name, count: count)
        }
        .store(in: &cancallables)
        
        BubbleNetworkManager.shared.shouldDelete.sink { name in
            self.deleteNode(with: name)
        }
        .store(in: &cancallables)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
}


extension BubbleVC: BubbleProtocol {
    
    func addNode(with name: String, image: UIImage? = nil) {
        var node: Node
        
        if let image = image {
            node = ImageNode(text: name, image: image, color: .white, radius: 55)
            node.selectedAnimation()
        } else {
            let color = UIColor(CTRandom.generateRandomColor())
            node = Node(text: name, image: nil, color: color, radius: 55)
        }
        
        node.fontName = "Montserrat-Bold"
        node.fontSize = 16
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
    
    
    override func selectedAnimation() {
        if let texture = texture {
          fillTexture = texture
        }
    }
    
    
    override func deselectedAnimation() {}
}

