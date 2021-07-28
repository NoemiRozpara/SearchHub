//
//  UIViewController+SwiftUI.swift
//  SearchHubApp
//
//  Created by Noemi Rozpara on 28/7/21.
//

import Foundation
import SwiftUI

extension UIViewController {
    func displaySwiftUIView<SomeView: View>(
        _ swiftUIView: SomeView,
        in rootView: UIView? = nil
    ) {
        guard let swiftUIWrapperView = rootView ?? self.view else {
            return
        }
        let uiHostingController = UIHostingController(rootView: swiftUIView)
        self.addChild(uiHostingController)
        uiHostingController.view.frame = swiftUIWrapperView.bounds
        swiftUIWrapperView.addSubview(uiHostingController.view)
        uiHostingController.didMove(toParent: self)
    }
}
