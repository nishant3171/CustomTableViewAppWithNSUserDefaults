//
//  TableLayout.swift
//  Dirty Neighbours
//
//  Created by nishant punia on 18/01/16.
//  Copyright © 2016 MLBNP. All rights reserved.
//

import Foundation

class TableLayout: NSObject, NSCoding {
    
    private var _dirtyImgAddress: String!
    private var _title: String!
    private var _postDesc: String!
    
    var dirtyImgAddress: String {
        return _dirtyImgAddress
    }
    
    var title: String {
        return _title
    }
    
    var postDesc: String {
        return _postDesc
    }
    
    init(dirtyImg: String,title: String,description: String) {
        self._dirtyImgAddress = dirtyImg
        self._title = title
        self._postDesc = description
    }
    
    override init() {
        
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self._dirtyImgAddress = (aDecoder.decodeObjectForKey("imageAddress") as? String)!
        self._postDesc = (aDecoder.decodeObjectForKey("desc") as? String)!
        self._title = (aDecoder.decodeObjectForKey("title") as? String)!
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self._dirtyImgAddress, forKey: "imageAddress")
        aCoder.encodeObject(self._postDesc, forKey: "desc")
        aCoder.encodeObject(self._title, forKey: "title")
    }
}
