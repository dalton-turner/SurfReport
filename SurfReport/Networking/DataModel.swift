//
//  DataModel.swift
//  SurfReport
//
//  Created by Dalton Turner on 7/11/22.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Request .self, from: jsonData)

import Foundation

// MARK: - Request
struct Request: Decodable {
    let hours: [Hour]?
    let meta: Meta?
}

// MARK: - Hour
struct Hour: Decodable {
    let airTemperature: AirTemperature?
    let seaLevel: SeaLevel?
    let swellDirection, swellHeight, swellPeriod: SwellDirection?
    let time: Date?
    let visibility: AirTemperature?
    let waterTemperature: WaterTemperature?
    let waveDirection, waveHeight, wavePeriod: SwellDirection?
}

// MARK: - AirTemperature
struct AirTemperature: Decodable {
    let dwd, icon, meteo, noaa, sg: Double?
}

// MARK: - SeaLevel
struct SeaLevel: Decodable {
    let dwd, icon, meteo, noaa, sg: Double?
}

// MARK: - SwellDirection
struct SwellDirection: Decodable {
    let dwd, icon, meteo, noaa, sg: Double?
}

// MARK: - WaterTemperature
struct WaterTemperature: Decodable {
    let dwd, icon, meteo, noaa, sg: Double?
}

// MARK: - Meta
struct Meta: Decodable {
    let cost, dailyQuota: Int?
    let end: String?
    let lat, lng: Double?
    let params: [String]?
    let requestCount: Int?
    let start: String?
}
