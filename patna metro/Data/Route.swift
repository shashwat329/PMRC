//
//  Route.swift
//  patna metro
//
//  Created by shashwat singh on 14/02/25.
//
struct MetroStation {
    let name: String
    let corridors: [String]
    let connections: [String] 
}

class MetroNetwork {
        var stations: [String: MetroStation] = [
                   // East-West Corridor
                   "Danapur Cantonment": MetroStation(name: "Danapur Cantonment", corridors: ["East-West"], connections: ["Saguna More"]),
                   "Saguna More": MetroStation(name: "Saguna More", corridors: ["East-West"], connections: ["Danapur Cantonment", "RPS More"]),
                   "RPS More": MetroStation(name: "RPS More", corridors: ["East-West"], connections: ["Saguna More", "Patliputra"]),
                   "Patliputra": MetroStation(name: "Patliputra", corridors: ["East-West"], connections: ["RPS More", "Rukanpura"]),
                   "Rukanpura": MetroStation(name: "Rukanpura", corridors: ["East-West"], connections: ["Patliputra", "Raja Bazar"]),
                   "Raja Bazar": MetroStation(name: "Raja Bazar", corridors: ["East-West"], connections: ["Rukanpura", "Patna Zoo"]),
                   "Patna Zoo": MetroStation(name: "Patna Zoo", corridors: ["East-West"], connections: ["Raja Bazar", "Vikas Bhawan"]),
                   "Vikas Bhawan": MetroStation(name: "Vikas Bhawan", corridors: ["East-West"], connections: ["Patna Zoo", "Vidyut Bhawan"]),
                   "Vidyut Bhawan": MetroStation(name: "Vidyut Bhawan", corridors: ["East-West"], connections: ["Vikas Bhawan", "Patna Junction"]),
                   
                   // **Patna Junction as Interchange Station in Both Corridors**
                   "Patna Junction": MetroStation(name: "Patna Junction", corridors: ["East-West", "North-South"], connections: ["Vidyut Bhawan", "Mithapur", "Akashvani"]),
                   
                   "Mithapur": MetroStation(name: "Mithapur", corridors: ["East-West"], connections: ["Patna Junction", "Ramkrishna Nagar"]),
                   "Ramkrishna Nagar": MetroStation(name: "Ramkrishna Nagar", corridors: ["East-West"], connections: ["Mithapur", "Jaganpur"]),
                   "Jaganpur": MetroStation(name: "Jaganpur", corridors: ["East-West"], connections: ["Ramkrishna Nagar", "Khemni Chak"]),
                   
                   // **Khemni Chak as Another Interchange**
                   "Khemni Chak": MetroStation(name: "Khemni Chak", corridors: ["East-West", "North-South"], connections: ["Jaganpur", "Malahi Pakri"]),

                   // North-South Corridor
                   "Akashvani": MetroStation(name: "Akashvani", corridors: ["North-South"], connections: ["Patna Junction", "Gandhi Maidan"]),
                   "Gandhi Maidan": MetroStation(name: "Gandhi Maidan", corridors: ["North-South"], connections: ["Akashvani", "PMCH"]),
                   "PMCH": MetroStation(name: "PMCH", corridors: ["North-South"], connections: ["Gandhi Maidan", "Patna University"]),
                   "Patna University": MetroStation(name: "Patna University", corridors: ["North-South"], connections: ["PMCH", "Moin Ul Haq Stadium"]),
                   "Moin Ul Haq Stadium": MetroStation(name: "Moin Ul Haq Stadium", corridors: ["North-South"], connections: ["Patna University", "Rajendra Nagar"]),
                   "Rajendra Nagar": MetroStation(name: "Rajendra Nagar", corridors: ["North-South"], connections: ["Moin Ul Haq Stadium", "Malahi Pakri"]),
                   "Malahi Pakri": MetroStation(name: "Malahi Pakri", corridors: ["North-South"], connections: ["Rajendra Nagar", "Khemni Chak"]),
                   "Bhoothnath": MetroStation(name: "Bhoothnath", corridors: ["North-South"], connections: ["Khemni Chak", "Zero Mile"]),
                   "Zero Mile": MetroStation(name: "Zero Mile", corridors: ["North-South"], connections: ["Bhoothnath", "New ISBT"]),
                   "New ISBT": MetroStation(name: "New ISBT", corridors: ["North-South"], connections: ["Zero Mile"])
        ]
    
    func findShortestPath(from source: String, to destination: String) -> [String]? {
          guard stations[source] != nil, stations[destination] != nil else {
              return nil // Source or Destination not found
          }

          var queue: [(station: String, path: [String])] = [(source, [source])]
          var visited: Set<String> = [source]

          while !queue.isEmpty {
              let (currentStation, path) = queue.removeFirst()

              // ✅ If the destination is found, return the path
              if currentStation == destination {
                  return path
              }

              // 🔄 Explore connected stations
              for next in stations[currentStation]?.connections ?? [] {
                  if !visited.contains(next) {
                      visited.insert(next)
                      queue.append((next, path + [next]))
                  }
              }
          }
          return nil // No path found
      }
}

