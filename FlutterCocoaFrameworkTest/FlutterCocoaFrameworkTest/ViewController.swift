//
//  ViewController.swift
//  FlutterCocoaFrameworkTest
//
//  Created by ksnowlv on 2024/4/17.
//

import UIKit
import Flutter

class ViewController: UIViewController {
    
    var flutterViewControllers:[FlutterViewController] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showFlutterViewEvent()  {
        //showSingleFlutterView()
        showTwoFlutterView()
    }
    
    @IBAction func removeFlutterViewsEvent()  {
        
        for item in flutterViewControllers {
            item.view.removeFromSuperview()
        }
        
        flutterViewControllers.removeAll();
    }
    
    
    func showTwoFlutterView() {
        
        guard flutterViewControllers.isEmpty else {
            return
        }
        
        let  viewWidth = CGRectGetWidth(self.view.frame)
        
        let flutterEngines = (UIApplication.shared.delegate as! AppDelegate).flutterEngines
        
        for engine in flutterEngines {
            let flutterViewController = FlutterViewController(engine: engine, nibName: nil, bundle: nil)

            self.view.addSubview(flutterViewController.view)
            self.view.bringSubviewToFront(flutterViewController.view)
            flutterViewControllers.append(flutterViewController)
            
        }

        flutterViewControllers[0].view.frame = CGRect(x: 0, y: 250, width: viewWidth/3, height: 500)
        flutterViewControllers[1].view.frame = CGRect(x: viewWidth * 2/3, y: 250, width: viewWidth/3, height: 500)
    }
    
    func showSingleFlutterView() {
        guard let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngines.first else { return }
        
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        let navigationController = UINavigationController(rootViewController: flutterViewController)
        navigationController.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissFlutterViewController))
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func dismissFlutterViewController() {
        dismiss(animated: true, completion: nil)
   }

}

