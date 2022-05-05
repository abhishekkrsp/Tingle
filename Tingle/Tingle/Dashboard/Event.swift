//
//  Event.swift
//  Final Project Demo
//
//  Created by Abhishek Kumar on 04/05/22.
//
import Foundation
enum BookingType: Codable {
    case chat, video
}
struct Event: Codable {
    var startTime: Date
    var duration: Int    // In minutes
    var organiser: String
    var joinLink: String
    var description: String
    var title: String
    var imageUrl: String
    var charges: Int // In Rupee
    var availableSeats: Int
    var category: BookingType
}
