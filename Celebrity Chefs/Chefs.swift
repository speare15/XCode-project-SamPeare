//
//  People.swift
//  Person Information
//
//  Created by Samuel Oliver Peare on 10/02/2026.
//

import Foundation

class Chefs{
    
    var chefData : [Chef]!
    
    init(){
        chefData = [
            // make some person data
            
            Chef(name: "Gordon Ramsay", dob: "08/11/1966", restaurants: "15", books: "23", tv: "49", cuisine: "European dishes", url: "https://www.gordonramsay.com/", image: "ramsay", video: "https://youtu.be/MrDU2m-gKQc"),
            Chef(name: "Marco Pierre White", dob: "11/12/1961", restaurants: "8", books: "10", tv: "19", cuisine: "Haute cuisine French British Italian", url: "https://www.marcopierrewhite.co/", image: "marco", video: "https://youtu.be/xzAbpWISfKE"),
            Chef(name: "Darina Allen", dob: "30/07/1948", restaurants: "1", books: "33", tv: "0", cuisine: "Traditional Irish Cooking", url: "https://www.ballymaloecookeryschool.ie/ballymaloe-cookery-school/darina-allen", image: "darina", video: "https://youtu.be/DdsypiDqJtI"),

             
        ]
    }
    
    init(fromXMLFile:String) {
        // make an XMLPeopleParser, begin parsing
        let parser = XMLChefParser(filename: fromXMLFile)
        parser.beginParsing()
        
        // init people with parser's data
        self.chefData = parser.chefsData
    }
    
    func getCount()->Int{return self.chefData.count}
    func getChef(index:Int)->Chef{return self.chefData[index]
    }
}
