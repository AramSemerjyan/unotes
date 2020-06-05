//
//  UIViewControllerExtension.swift
//  UNotes
//
//  Created by Aram Semerjyan on 6/5/20.
//  Copyright © 2020 home. All rights reserved.
//

import UIKit

extension UIViewController {
    static func instantiateController() -> Self {
        let storyboard = UIStoryboard.init(name: self.name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: self.name)

        guard let typedViewController = viewController as? Self else {
          fatalError("The initialViewController of '\(storyboard)' is not of class '\(self)'")
        }

        return typedViewController
    }
}
