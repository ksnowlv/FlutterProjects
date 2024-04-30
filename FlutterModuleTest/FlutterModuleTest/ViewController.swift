//
//  ViewController.swift
//  FlutterModuleTest
//
//  Created by ksnowlv on 2024/3/22.
//

import UIKit

import Flutter

class ViewController: UIViewController {
    @IBOutlet weak var flutterInfoLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showFlutterView()  {
        let flutterEngine = (UIApplication.shared.delegate as! AppDelegate).flutterEngine
        let flutterViewController = FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
        
        setupMethodChannel(flutterViewController)
        setupBasicMessageChannel(flutterViewController)
        
        let navigationController = UINavigationController(rootViewController: flutterViewController)
        navigationController.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(dismissFlutterViewController))
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func dismissFlutterViewController() {
        dismiss(animated: true, completion: nil)
        
    }
    
    
    func setupMethodChannel(_ flutterViewController: FlutterViewController) {
        let methodChannel = FlutterMethodChannel(name:"com.example.flutter_channel",binaryMessenger:flutterViewController as!FlutterBinaryMessenger)
        //向flutterView发送消息
        methodChannel.invokeMethod("openFlutterView",arguments:["ksnowlv",10])
        
        // 处理Flutter的返回消息
        methodChannel.setMethodCallHandler { (call,result) in
            if call.method == "dataFromFlutter" {
                print("data from flutter \(String(describing: result))")
                if let arguments = call.arguments as?Dictionary<String,Any>,
                   let message = arguments["message"] as?String,
                   let count = arguments["count"] as?Int {
                    
                    DispatchQueue.main.async { [self] in
                        // 在主线程中更新UI
                        flutterInfoLabel.text = "from flutter:message:\(message),count:\(count)"
                    }
                    // 可选：返回一个结果给Flutter
                    result("Data received successfully")
                }
            }
        }
    }
    
    func setupBasicMessageChannel(_ flutterViewController: FlutterViewController) {
        let flutterMessageChannel = FlutterBasicMessageChannel(name:"com.example.flutter_channel_basic_message_channel",binaryMessenger:flutterViewController as!FlutterBinaryMessenger)
        
        let arguments:[String:Any] = [
            "name":"ksnowlv from iOS",
            "age":10
        ]
        flutterMessageChannel.sendMessage(arguments) { (reply) in
            print("Received reply from Flutter:\(String(describing: reply))")
            
        }
        
        // 监听 Flutter 发送回 iOS 的消息
        
        flutterMessageChannel.setMessageHandler { [weak self] (message, reply)  in
            
            if let data = message as? Dictionary<String,Any>,
                let msg = data["message"] as? String,
               let count = data["count"] as? Int {
                
                DispatchQueue.main.async { [weak self] in
                    // 在主线程中更新UI
                    self?.flutterInfoLabel.text = "from flutter:message:\(msg),count:\(count)"
                }
                // 返回一个结果给Flutter
                reply("iOS Data received successfully")
                
                print("Received result from Flutter: \(message)")
                
            }
            
        }
    }
    
}

