//
//  ViewController.swift
//  BlockChainTest
//
//  Created by John Jones on 05/12/2017.
//  Copyright © 2017 William Hill. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var blockChain = [Block]()
        // Genisis block added.
        blockChain.append(Block(index: 0, previousHash: "0", data: "My Genesis Block"))
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

