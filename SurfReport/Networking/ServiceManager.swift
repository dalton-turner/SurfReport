//
//  ServiceManager.swift
//  SurfReport
//
//  Created by Dalton Turner on 7/12/22.
//

import Foundation

struct Objects {
    var sectionName : String!
    var sectionObjects : [String]!
}

public class ServiceManager {
    public static let shared = ServiceManager()
    var sampleData: Request?

    var objectArray = [Objects]()
    
    func extractDatePart(from date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    func getJSON(resource: String) -> Data? {
        if let path = Bundle.main.path(forResource: resource, ofType: "json") {
            do {
                let data = try String(contentsOfFile: path).data(using: .utf8)
                print("Successfully fetched JSON")
                return data
            } catch {
                print("Failed to fetch JSON")
            }
        }
        return nil
    }
    
    func parseJSON(jsonData: Data) {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            sampleData = try decoder.decode(Request.self, from: jsonData)
            
            for hours in sampleData?.hours ?? [] {
                guard let time = hours.time else {
                    return
                }
                let date = extractDatePart(from: time, format: "yyyy/MM/dd")
                let hour = extractDatePart(from: time, format: "HH:mm")

                let airTempArray = [
                    hours.airTemperature?.dwd,
                    hours.airTemperature?.icon,
                    hours.airTemperature?.meteo,
                    hours.airTemperature?.noaa,
                    hours.airTemperature?.sg,
                ].compactMap { $0 }
                
                let averageAirTemp = airTempArray.reduce(0.0) {
                    return $0 + $1/Double(airTempArray.count)
                }
                
                let waterTempArray = [
                    hours.waterTemperature?.dwd,
                    hours.waterTemperature?.icon,
                    hours.waterTemperature?.meteo,
                    hours.waterTemperature?.noaa,
                    hours.waterTemperature?.sg,
                ].compactMap { $0 }
                
                let averageWaterTemp = waterTempArray.reduce(0.0) {
                    return $0 + $1/Double(waterTempArray.count)
                }
                
                let visibilityArray = [
                    hours.visibility?.dwd,
                    hours.visibility?.icon,
                    hours.visibility?.meteo,
                    hours.visibility?.noaa,
                    hours.visibility?.sg,
                ].compactMap { $0 }
                
                let averageVisibility = visibilityArray.reduce(0.0) {
                    return $0 + $1/Double(visibilityArray.count)
                }
                
                let seaLevelArray = [
                    hours.seaLevel?.dwd,
                    hours.seaLevel?.icon,
                    hours.seaLevel?.meteo,
                    hours.seaLevel?.noaa,
                    hours.seaLevel?.sg,
                ].compactMap { $0 }
                
                let averageSeaLevel = seaLevelArray.reduce(0.0) {
                    return $0 + $1/Double(seaLevelArray.count)
                }
                
                let swellDirectionArray = [
                    hours.swellDirection?.dwd,
                    hours.swellDirection?.icon,
                    hours.swellDirection?.meteo,
                    hours.swellDirection?.noaa,
                    hours.swellDirection?.sg,
                ].compactMap { $0 }
                
                let averageSwellDirection = swellDirectionArray.reduce(0.0) {
                    return $0 + $1/Double(swellDirectionArray.count)
                }
                
                let swellHeightArray = [
                    hours.swellHeight?.dwd,
                    hours.swellHeight?.icon,
                    hours.swellHeight?.meteo,
                    hours.swellHeight?.noaa,
                    hours.swellHeight?.sg,
                ].compactMap { $0 }
                
                let averageSwellHeight = swellHeightArray.reduce(0.0) {
                    return $0 + $1/Double(swellHeightArray.count)
                }
                
                let swellPeriodArray = [
                    hours.swellPeriod?.dwd,
                    hours.swellPeriod?.icon,
                    hours.swellPeriod?.meteo,
                    hours.swellPeriod?.noaa,
                    hours.swellPeriod?.sg,
                ].compactMap { $0 }
                
                let averageSwellPeriod = swellPeriodArray.reduce(0.0) {
                    return $0 + $1/Double(swellPeriodArray.count)
                }
                
                let waveDirectionArray = [
                    hours.waveDirection?.dwd,
                    hours.waveDirection?.icon,
                    hours.waveDirection?.meteo,
                    hours.waveDirection?.noaa,
                    hours.waveDirection?.sg,
                ].compactMap { $0 }
                
                let averageWaveDirection = waveDirectionArray.reduce(0.0) {
                    return $0 + $1/Double(waveDirectionArray.count)
                }
                
                let waveHeightArray = [
                    hours.waveHeight?.dwd,
                    hours.waveHeight?.icon,
                    hours.waveHeight?.meteo,
                    hours.waveHeight?.noaa,
                    hours.waveHeight?.sg,
                ].compactMap { $0 }
                
                let averageWaveHeight = waveHeightArray.reduce(0.0) {
                    return $0 + $1/Double(waveHeightArray.count)
                }
                
                let wavePeriodArray = [
                    hours.wavePeriod?.dwd,
                    hours.wavePeriod?.icon,
                    hours.wavePeriod?.meteo,
                    hours.wavePeriod?.noaa,
                    hours.wavePeriod?.sg,
                ].compactMap { $0 }
                
                let averageWavePeriod = wavePeriodArray.reduce(0.0) {
                    return $0 + $1/Double(wavePeriodArray.count)
                }
                
                var statStrings = ["Air Temperature: \(averageAirTemp)",
                             "Water Temperature: \(averageWaterTemp)",
                             "Visibility: \(averageVisibility)",
                             "Sea Level: \(averageSeaLevel)",
                             "Swell Height: \(averageSwellHeight)",
                             "Swell Period: \(averageSwellPeriod)",
                             "Swell Direction: \(averageSwellDirection)",
                             "Wave Height: \(averageWaveHeight)",
                             "Wave Period: \(averageWavePeriod)",
                             "Wave Direction: \(averageWaveDirection)",
                ]
                statStrings.insert(hour, at: 0)
                
                objectArray.append(Objects(sectionName: date, sectionObjects: statStrings))
            }
        } catch {
            print("Failed to decode JSON")
        }
    }
        
    func provideParsedData(for jsonFile: String) -> [Objects] {
        guard let extractedData = getJSON(resource: jsonFile) else {
            return [Objects]()
        }
        parseJSON(jsonData: extractedData)
        return objectArray
    }
}
