//
//  Person.swift
//  Person Information
//
//  Created by Samuel Oliver Peare on 10/02/2026.
//

import Foundation

class Chef{
    var name:String
    var dob:String
    var restaurants:String
    var books:String
    var tv: String
    var cuisine: String
    var url: String
    var image:String
    var video:String
    
    init(name: String, dob: String, restaurants: String, books: String, tv: String, cuisine: String, url:String, image:String, video:String) {
        self.name = name
        self.dob = dob
        self.restaurants = restaurants
        self.books = books
        self.tv = tv
        self.cuisine = cuisine
        self.url = url
        self.image = image
        self.video = video
    }
}
