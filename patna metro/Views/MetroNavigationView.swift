import SwiftUI

struct MetroNavigationView: View {
    @State private var source: String = ""
    @State private var destination: String = ""
    @State private var route: [String] = []
    @State private var showRouteView = false
    
    @State private var showDropdown1 = false  // Controls source dropdown
    @State private var showDropdown2 = false  // Controls destination dropdown
    
    let metro = MetroNetwork()
    let stations: [String] = [
        "Danapur Cantonment", "Saguna More", "RPS More", "Patliputra", "Rukanpura",
        "Raja Bazar", "Patna Zoo", "Vikas Bhawan", "Vidyut Bhawan", "Patna Junction",
        "Mithapur", "Ramkrishna Nagar", "Jaganpur", "Khemni Chak", "Akashvani",
        "Gandhi Maidan", "PMCH", "Patna University", "Moin Ul Haq Stadium", "Rajendra Nagar",
        "Malahi Pakri", "Bhoothnath", "Zero Mile", "New ISBT"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            VStack(spacing: 15) {
                SearchableTextField(
                    title: "Select Source", text: $source, options: stations,
                    showDropdown: $showDropdown1, otherDropdown: $showDropdown2
                )
                
                SearchableTextField(
                    title: "Select Destination", text: $destination, options: stations,
                    showDropdown: $showDropdown2, otherDropdown: $showDropdown1
                )
            }
            
            Button(action: {
                if let foundRoute = metro.findShortestPath(from: source, to: destination) {
                    route = foundRoute
                    showRouteView = true
                } else {
                    route = ["No route found"]
                }
            }) {
                Text("Find Route")
                    .font(.title2.bold())
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
            
        }
        .padding()
        .sheet(isPresented: $showRouteView) {
            RouteDetailView(source: $source, destination: $destination, route: route, showRouteView: $showRouteView)
        }
    }
}

struct SearchableTextField: View {
    var title: String
    @Binding var text: String
    var options: [String]
    
    @Binding var showDropdown: Bool
    @Binding var otherDropdown: Bool
    
    var filteredOptions: [String] {
        if text.isEmpty {
            return options
        } else {
            return options.filter { $0.lowercased().contains(text.lowercased()) }
        }
    }
    
    var body: some View {
        VStack {
            TextField(title, text: $text, onEditingChanged: { isEditing in
                if isEditing {
                    showDropdown = true
                    otherDropdown = false // Close the other dropdown
                }
            })
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            
            if showDropdown {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(filteredOptions, id: \.self) { option in
                            Text(option)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .onTapGesture {
                                    text = option
                                    showDropdown = false // Close dropdown after selection
                                }
                        }
                    }
                }
                .frame(height: 150)
                
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
    }
}

struct RouteDetailView: View {
    @Binding var source: String
    @Binding var destination: String
    let route: [String]
    @Binding var showRouteView: Bool
    
    var interchangeCount: Int {
        route.filter { $0 == "Patna Junction" || $0 == "Khemni Chak" }.count
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                Button(action: { showRouteView = false }) {
                    Image(systemName: "xmark")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                }
            }
            
            Text("Route Details")
                .font(.largeTitle.bold())
                .foregroundColor(.blue)
                .padding(.top, 20)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Source: \(source)")
                    .font(.headline)
                Text("Destination: \(destination)")
                    .font(.headline)
                Text("Number of Interchanges: \(interchangeCount)")
                    .font(.headline)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .padding(.horizontal)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(route, id: \..self) { station in
                        HStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 10, height: 10)
                            Text(station)
                                .font(.headline)
                        }
                    }
                }
                .padding()
            }
            .frame(maxWidth: .infinity, minHeight: 200)
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
            .padding()
        }
        .padding()
    }
}

#Preview{
    MetroNavigationView()
}
