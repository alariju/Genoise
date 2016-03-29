//
//  Genoise.swift
//  Pods
//
//  Created by aarias on 3/21/16.
//
//

import Foundation

@objc public class Genoise: NSObject {
    
    static var applicationId: String? = nil
    
    /**
     This method initializes the service.
     
     - parameter applicationId: application's ID. Can be get from iTunes Connect page.
     
     */
    public class func initializeWithApplicationId(applicationId: String) {
        self.applicationId = applicationId
    }
    
    /**
     This method checks if the local application has a lower version than the one on the store.
     
     - parameter callback: callback method that receives a boolean with the result and a string with the release notes.
     */
    public class func isOutdated(callback: (Bool, String) -> () ) {
        let url = NSURL(string: self.getAppURL())!
        let session = NSURLSession.sharedSession()
        let internetTask = session.dataTaskWithURL(url) {
            data, response, error in
            if let _ = error {
                callback(false, "")
            } else {
                let content = try? NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                let results = content?.objectForKey("results") as! NSArray
                let app = results.firstObject!
                let version = app.objectForKey("version") as! String
                let releaseNotes = app.objectForKey("releaseNotes") as! String
                if self.isLocalVersionLowerThanStoreVersion(version) {
                    callback(true, releaseNotes)
                } else {
                    callback(false, "")
                }
            }
        }
        internetTask.resume()
    }
    
    /**
     Private func. Returns the iTunes API URL for the application.
     
     - returns: app's iTunes API URL
     */
    public class func getAppURL () -> String {
        return "https://itunes.apple.com/lookup?id=\(applicationId!)"
    }
    
    /**
     Public func. Returns store url for the app
     
     - returns: App's App Store URL for updating
     */
    public class func getStoreURL () -> String {
        let countryCode = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode) as! String
        return "https://itunes.apple.com/\(countryCode)/app/id\(self.applicationId!)?mt=8"
    }
    
    /**
     Private func. Gets the local app version.
     
     - returns: local app's version
     */
    public class func getLocalAppVersion () -> String {
        return NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"]! as! String
    }
    
    /**
     Private func. Parses the versions and converts them to an array of integers to call the compareVersions(localNumbers, storeNumbers) method.
     
     - parameter storeVersion: version obtained from iTunes API.
     
     - returns: true if local version is lower, false if not.
     */
    public class func isLocalVersionLowerThanStoreVersion(storeVersion: String) -> Bool {
        let localVersion = getLocalAppVersion()
        let localVersionNumbers = localVersion.componentsSeparatedByString(".")
        let storeVersionNumbers = storeVersion.componentsSeparatedByString(".")
        return compareVersions(toIntArray(localVersionNumbers), storeNumbers: toIntArray(storeVersionNumbers))
    }
    
    /**
     Converts an array of int as string, to an array of int.
     
     - parameter array: array of int as string.
     
     - returns: array of ints.
     */
    public class func toIntArray(array: [String]) -> NSMutableArray {
        let result: NSMutableArray = NSMutableArray()
        for letter in array {
            result.addObject(Int(letter)!)
        }
        return result
    }
    
    /**
     Private func. Recursive. Compares two arrays of numbers (each array is a version), to know if the local version is lower than the one on the store.
     
     - parameter localNumbers: local version as an array of int.
     - parameter storeNumbers: store version as an array of int.
     
     - returns: returns true if local version is lower than store.
     */
    public class func compareVersions(localNumbers: NSMutableArray, storeNumbers: NSMutableArray) -> Bool {
        if localNumbers.count == 0 && storeNumbers.count == 0 {
            return false
        } else {
            if storeNumbers.count == 0 && !(localNumbers.count == 0) {
                return false
            } else {
                if localNumbers.count == 0 && !(storeNumbers.count == 0) {
                    return true
                } else {
                    if (localNumbers.firstObject as! Int) < (storeNumbers.firstObject as!  Int){
                        return true
                    } else {
                        localNumbers.removeObjectAtIndex(0)
                        storeNumbers.removeObjectAtIndex(0)
                        return compareVersions(localNumbers, storeNumbers: storeNumbers)
                    }
                }
            }
        }
    }
}