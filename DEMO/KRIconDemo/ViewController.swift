//
//  ViewController.swift
//  KRIconDemo
//
//  Created by Ryunosuke Kirikihira on 2015/09/16.
//  Copyright © 2015年 Ryunosuke Kirikihira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var iconCollection: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.iconCollection.delegate = self
        self.iconCollection.dataSource = self
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return IconType.TYPE.hashValue
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as? IconCell
        
        if cell == nil {
            cell = IconCell()
        }
     
        // set icon 
        cell!.iconView.type = indexPath.row
        
        return cell!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

class IconCell :UICollectionViewCell {
    
    @IBOutlet weak var iconView: KRIconView!
    
}