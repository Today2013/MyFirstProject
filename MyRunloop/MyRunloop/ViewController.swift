//
//  ViewController.swift
//  MyRunloop
//
//  Created by TomatoPeter on 16/7/12.
//  Copyright © 2016年 ChenJianglin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //
        let currentLoop = NSRunLoop.currentRunLoop()
        print("主线程：", currentLoop)
//        <CFRunLoop 0x7fa69ac066b0 [0x101ebaa40]>{wakeup port = 0x1403, stopped = false, ignoreWakeUps = false, 
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let currentLoop1 = NSRunLoop.currentRunLoop()
            print("子线程1：", currentLoop1)
//            子线程1： <CFRunLoop 0x7fa69ad20280 [0x101ebaa40]>{wakeup port = 0x4b03, stopped = false, ignoreWakeUps = true,
            
        }
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let currentLoop2 = NSRunLoop.currentRunLoop()
            print("子线程2：", currentLoop2)
//            子线程2： <CFRunLoop 0x7fa69ae20950 [0x101ebaa40]>{wakeup port = 0x4e03, stopped = false, ignoreWakeUps = true,
            
            let timer = NSTimer.init(timeInterval: 1, target: self, selector: #selector(self.text), userInfo: nil, repeats: true);
            currentLoop2.addTimer(timer, forMode: NSDefaultRunLoopMode)
            currentLoop2.run()
        }
        
        dispatch_async(dispatch_get_main_queue()) { 
            let currentLoop3 = NSRunLoop.currentRunLoop()
            print("主线程：", currentLoop3)
//            主线程： <CFRunLoop 0x7fa69ac066b0 [0x101ebaa40]>{wakeup port = 0x1403, stopped = false, ignoreWakeUps = true,
            
            
        }
        //结论：1.每个线程都会有一个runloop对象  自己创建的线程默认都是没有启动的  2.在子线程中的timer函数要加到runloop中否则计时器将不会启动
        
        
        
        //此时已经进行了一次深复制
        let stu = Student()
        let stu1 = stu.copy()
        
        print("++++++", stu, stu1)
        
    }
    func text() -> Void {
        
        print("测试")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

