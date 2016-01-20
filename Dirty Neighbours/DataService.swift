//
//  DataService.swift
//  Dirty Neighbours
//
//  Created by nishant punia on 19/01/16.
//  Copyright © 2016 MLBNP. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    
    static var instance = DataService()
    
    private var _loadedPosts = [TableLayout]()
    
    var loadedPosts: [TableLayout] {
        return _loadedPosts
    }
    
    func savePosts() {
        let postsData = NSKeyedArchiver.archivedDataWithRootObject(_loadedPosts)
        NSUserDefaults.standardUserDefaults().setObject(postsData, forKey: "posts")
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    func loadPosts() {
        
        if let postsData = NSUserDefaults.standardUserDefaults().objectForKey("posts") as? NSData {
            
            if let postsArray = NSKeyedUnarchiver.unarchiveObjectWithData(postsData) as? [TableLayout] {
                _loadedPosts = postsArray
            }
        }
        NSNotificationCenter.defaultCenter().postNotificationName("postsLoaded", object: nil)
        
        
    }
    
    func saveImageandCreatePath(image: UIImage) ->String {
        
        let imgData = UIImagePNGRepresentation(image)
        let imgPath = "image\(NSDate.timeIntervalSinceReferenceDate()).png"
        let fullPath = documentsForPathFileName(imgPath)
        imgData?.writeToFile(fullPath, atomically: true)
        return imgPath
        
    }
    
    func imageForPath(path: String) -> UIImage? {
        
        let fullPath = documentsForPathFileName(path)
        let image = UIImage(named: fullPath)
        return image
        
    }
    
    func addPost(post: TableLayout) {
        _loadedPosts.append(post)
        savePosts()
        loadPosts()
    }
    
    func documentsForPathFileName(name: String) ->String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let fullPath = paths[0] as NSString
        return fullPath.stringByAppendingPathComponent(name)
    }
}