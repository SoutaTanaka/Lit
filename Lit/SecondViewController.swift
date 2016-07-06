//
//  SecondViewController.swift
//  Lit
//
//  Created by 田中颯太 on 2016/06/01.
//  Copyright © 2016年 田中颯太. All rights reserved.
//　http://anthrgrnwrld.hatenablog.com/entry/2015/10/27/221856
//　https://akira-watson.com/iphone/collectionview.html

import UIKit
import AssetsLibrary
class SecondViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    var photo:[NSData] = []
    @IBOutlet var collection: UICollectionView!
    let data: NSUserDefaults = NSUserDefaults.standardUserDefaults()
    
    
    override func viewDidLoad() {
        if data.arrayForKey("photos") != nil{
            photo = data.arrayForKey("photos") as! [NSData]
        }
        
        super.viewDidLoad()
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let testCell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        let imageView = testCell.contentView.viewWithTag(1) as! UIImageView
        let cellImage = photo[indexPath.row]
        imageView.image = UIImage(data: cellImage)
        return testCell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellSize:CGFloat = self.view.frame.size.width/2 - 10
        return CGSizeMake(cellSize, cellSize)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func pictur(sender: AnyObject) {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)){
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .PhotoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if  let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            let nsdata: NSData = UIImagePNGRepresentation(editedImage)!
            photo.append (nsdata)
            collection.reloadData()
            data.setObject(photo, forKey: "photos")
        }
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
        
}


