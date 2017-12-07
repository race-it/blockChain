//
//  BlockChain.swift
//  BlockChainTest
//
//  Created by John Jones on 06/12/2017.
//  Copyright © 2017 William Hill. All rights reserved.
//

import Foundation

class BlockChain {
    var chain = [Block]()

    init() {
        // Genisis block added.
        chain.append(createGenesisBlock())
        
    }
    
    func createGenesisBlock() -> Block {
        return Block(index: 0, previousHash: "123456RACEIT-GENESIS", data: "My Genesis Block")
    }

    func getLatestBlock() -> Block {
        return chain.last!
    }

    func addBlock(newBlock: Block) {
        newBlock.previousHash = self.getLatestBlock().hash;
        newBlock.hash = newBlock.calculateHash()
        newBlock.mineBlock(difficulty: 3)
        self.chain.append(newBlock)
    }
    
    func calculateHashForBlock(block: Block) -> String {
        let b = Block(index: block.index!, previousHash: block.previousHash!, data: block.data!)
        return b.hash!
    }
    
    func isValidBlock(newBlock: Block, previousBlock: Block) -> Bool {
        if (previousBlock.index! + 1 != newBlock.index) {
            // invalid index
            return false
        } else if (previousBlock.hash != newBlock.previousHash) {
            // invalid previous hash
            return false
        } else if (calculateHashForBlock(block: newBlock) != newBlock.hash) {
            // invalid hash in new block
            return false
        }
        return true;
    }
    
    func isChainValid() -> Bool {
        for i in 1 ... chain.count where i < chain.count {
            let currentBlock = self.chain[i]
            let previousBlock = self.chain[i-1]
            
            if (currentBlock.hash != currentBlock.calculateHash()) {
                return false
            }
            if (currentBlock.previousHash != previousBlock.hash) {
                return false
            }
        }
        return true
    }
 
}
