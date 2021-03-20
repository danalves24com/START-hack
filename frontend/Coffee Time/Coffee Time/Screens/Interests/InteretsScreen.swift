//
//  InteretsScreen.swift
//  Coffee Time
//
//  Created by Kai Zheng on 20.03.21.
//

import SwiftUI
import SpriteKit
import Magnetic

struct InterestsScreen: View {
    
    var body: some View {
        VStack {
            BubbleView()
        }
    }
}


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


class BubbleVC: UIViewController {
    
    var magneticView: MagneticView! {
        didSet {
            magnetic?.magneticDelegate = self
            magnetic?.removeNodeOnLongPress = true
        }
    }
    
    
    var magnetic: Magnetic?
    
    
    override func viewDidLoad() {
        let magneticView = MagneticView(frame: self.view.bounds)
        magnetic = magneticView.magnetic
        view.addSubview(magneticView)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for _ in 0..<12 {
            add()
        }
    }
    
    
    func updateNode(with name: String) {
        let node = magnetic?.childNode(withName: name)
        node?.setScale(1.2)
    }
    
    
    func add() {
        let node = Node(text: "Sample", image: nil, color: .blue, radius: 40)
        node.scaleToFitContent = true
        node.selectedColor = .brown
        node.name = "Meditate"
        magnetic?.addChild(node)
        
        // Image Node: image displayed by default
        // let node = ImageNode(text: name.capitalized, image: UIImage(named: name), color: color, radius: 40)
        // magnetic.addChild(node)
    }
}

// MARK: - MagneticDelegate
extension BubbleVC: MagneticDelegate {
    
    func magnetic(_ magnetic: Magnetic, didSelect node: Node) {
        print("didSelect -> \(node)")
    }
    
    func magnetic(_ magnetic: Magnetic, didDeselect node: Node) {
        print("didDeselect -> \(node)")
    }
    
    func magnetic(_ magnetic: Magnetic, didRemove node: Node) {
        print("didRemove -> \(node)")
    }
    
}

// MARK: - ImageNode
class ImageNode: Node {
    override var image: UIImage? {
        didSet {
            texture = image.map { SKTexture(image: $0) }
        }
    }
    override func selectedAnimation() {}
    override func deselectedAnimation() {}
}
