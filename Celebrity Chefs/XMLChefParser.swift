//
//  XMLChefParser.swift
//  Celebrity Chefs
//
//  Created by Samuel Oliver Peare on 05/03/2026.
//

import Foundation

class XMLChefParser: NSObject, XMLParserDelegate {

    var filename: String
    
    init(filename:String) {
        self.filename = filename
    }
    
    //MARK: - vars needed to parse
    
    // tags and pvars to store data from xml
    var pName, pDob, pRestaurants, pBooks, pTv, pCuisine, pUrl, pImage, pVideo : String!
    let tags = ["name", "dob", "restaurants", "books", "tv", "cuisine", "url", "image", "video"]
    
    //spy vars
    var passData = false
    var elementId = -1
    
    // person and people
    var chefData : Chef!
    var chefsData = [Chef]()
    
    // parser
    var parser : XMLParser!
    
    //MARK: - delegate methods
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        // check elementName in tags
        if tags.contains(elementName){
            //spy it
            passData = true
            switch elementName{
            case "name"        : elementId = 0
            case "dob"         : elementId = 1
            case "restaurants" : elementId = 2
            case "books"       : elementId = 3
            case "tv"          : elementId = 4
            case "cuisine"     : elementId = 5
            case "url"         : elementId = 6
            case "image"       : elementId = 7
            case "video"       : elementId = 8
            default : break
            }
        }
    }
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        // if spy said true then store data
        if passData{
            switch elementId{
                case 0: pName = string
                case 1: pDob = string
                case 2: pRestaurants = string
                case 3: pBooks = string
                case 4: pTv = string
                case 5: pCuisine = string
                case 6: pUrl = string
                case 7: pImage = string
                case 8: pVideo = string
                default: break
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        // reset spies
        if tags.contains(elementName){
            passData = false
            elementId = -1
        }
        
        // check end tag person
        if elementName == "chef"{
            // make personData and append it to peopleData
            chefData = Chef(name: pName, dob: pDob, restaurants: pRestaurants, books: pBooks, tv: pTv, cuisine: pCuisine, url: pUrl, image: pImage, video: pVideo)
            chefsData.append(chefData)
        }
    }
    func beginParsing(){
        // get the url from filename
        let bundleURL = Bundle.main.bundleURL
        let fileURL   = URL(filePath: self.filename, relativeTo: bundleURL)
        
        // make parser and parse
        parser = XMLParser(contentsOf: fileURL)
        parser.delegate = self
        parser.parse()
    }

}
