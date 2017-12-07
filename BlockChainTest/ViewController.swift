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
        
        // Create new block Chain
        let bc = BlockChain()
        
        // Add an item to the block chain
        let numberOfBlocksToAdd = 20
        
        let previous_block = bc.chain[0]
        
        for _ in 0 ... numberOfBlocksToAdd {
            let newBlock = Block(index: UInt(bc.chain.count), previousHash: bc.getLatestBlock().hash!, data: "test data ")
            bc.addBlock(newBlock:newBlock)
            //let block_to_add = next_block(previous_block)
            //blockchain.append(block_to_add)
            //previous_block = block_to_add
            // Tell everyone about it!

            print("Block #{} has been added to the blockchain" + (bc.getLatestBlock().index?.description)!)
            print("Hash {}" + bc.getLatestBlock().hash!)
            
            
        }
        
        print(bc.getLatestBlock().index?.description as Any)
        print("is chaing valid " + bc.isChainValid().description)
        let b = Block(index: 6, previousHash: "432424234324242424234", data: "test, shoiuylkd not be there")
        bc.addBlock(newBlock: b)
        
        print("is chaing valid " + bc.isChainValid().description)
        print(bc.getLatestBlock().index?.description as Any)
        
        bc.chain[20].hash = "fddf"
        print("is chaing valid " + bc.isChainValid().description)
        print(bc.getLatestBlock().index?.description as Any)
        //bc.add(data: "test2")

        
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

