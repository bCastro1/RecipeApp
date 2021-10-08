//
//  SceneDelegate.swift
//  MealTimeApp
//
//  Created by Brendan Castro on 10/4/21.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let windowScene = (scene as? UIWindowScene) else { return }
            
        UINavigationBar.appearance().backgroundColor = .systemBackground
        
        
            let window = UIWindow(windowScene: windowScene)
            let homeVC = Home_Controller()
            let navController = UINavigationController()
            navController.viewControllers = [homeVC]
            window.rootViewController = navController
            self.window = window
            window.makeKeyAndVisible()
            
        }
}

