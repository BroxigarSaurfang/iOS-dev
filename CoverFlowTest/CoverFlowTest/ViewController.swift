//
//  ViewController.swift
//  CoverFlowTest
//
//  Created by ASURADA on 2018. 5. 7..
//  Copyright © 2018년 ASURADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var coverFlowLayout: CoverFlowLayout!
    
    var imageArray = ["billy-huynh-327754", "federica-galli-449563", "IMG_1458", "jason-blackeye-295313", "jesus-kiteque-224069", "kawin-harasai-71463", "kimson-doan-341940", "vashti-collins-53161"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let insetSide = collectionView.bounds.size.width/4
        
        coverFlowLayout.sectionInset = UIEdgeInsetsMake(0, insetSide, 0, insetSide)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.albumImage.image = UIImage(named: imageArray[indexPath.row])
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.size.width/2
        let height = collectionView.bounds.size.height/2
        
        return CGSize(width: width, height: height)
    }
    
    

    

}

