//
//  SwiftfulSwiftUIInPracticeApp.swift
//  SwiftfulSwiftUIInPractice
//
//  Created by Rizal Fahrudin on 22/04/24.
//

import SwiftUI
import SwiftfulRouting

@main
struct SwiftfulSwiftUIInPracticeApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                ContentView()
            }
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }

    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
