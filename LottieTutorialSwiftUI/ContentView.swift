//
//  ContentView.swift
//  LottieTutorialSwiftUI
//
//  Created by Evandro Harrison Hoffmann on 02/10/2021.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
        LottieView(url: URL(string: "https://assets7.lottiefiles.com/packages/lf20_mthcmrjn.json")!)
    }
}

struct LottieView: UIViewRepresentable {
    var url: URL
    
    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = AnimationView()
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        
        Animation.loadedFrom(url: url, closure: { animation in
            animationView.animation = animation
            animationView.play()
        }, animationCache: LRUAnimationCache.sharedCache)
        
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
