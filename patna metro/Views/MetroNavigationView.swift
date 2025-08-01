import SwiftUI

struct MetroNavigationView: View {
    @State private var source: String = ""
    @State private var destination: String = ""
    @State private var route: [String] = []
    @State private var showRouteView = false
    
    @State private var showDropdown1 = false
    @State private var showDropdown2 = false 
    
    let metro = MetroNetwork()
    let stations: [String] = [
        "Danapur Cantonment", "Saguna More", "RPS More", "Patliputra", "Rukanpura",
        "Raja Bazar", "Patna Zoo", "Vikas Bhawan", "Vidyut Bhawan", "Patna Junction",
        "CNLU","Mithapur", "Ramkrishna Nagar", "Jaganpur", "Khemni Chak", "Akashvani",
        "Gandhi Maidan", "PMCH", "Patna University", "Moin Ul Haq Stadium", "Rajendra Nagar",
        "Malahi Pakri", "Bhoothnath", "Zero Mile", "New ISBT"
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Find Your Route")
                .font(.largeTitle)
                .foregroundStyle(Color(hex: "#1eacfa"))
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
                    print(route)
                }
                else {
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
        Spacer()
            .fullScreenCover(isPresented: $showRouteView) {
                RouteDetailView(source: $source, destination: $destination, route: $route, showRouteView: $showRouteView)
                
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
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    .fill(Color.primaryColorTheme)
                    .frame(maxWidth: .infinity,maxHeight: 55)
                TextField(title, text: $text, onEditingChanged: { isEditing in
                    if isEditing {
                        showDropdown = true
                        otherDropdown = false
                    }
                })
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(10)
            }
            
            if showDropdown {
                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(filteredOptions, id: \.self) { option in
                            Text(option)
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .onTapGesture {
                                    text = option
                                    showDropdown = false
                                }
                        }
                    }
                }
                .frame(height: 150)
                .background(.gray.opacity(0.2))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
    }
}

struct RouteDetailView: View {
    @Binding var source: String
    @Binding var destination: String
    @Binding var route: [String]
    @Binding var showRouteView: Bool
    @State private var count: Int = 0
    var interchangeCount: Int {
        route.filter { $0 == "Patna Junction" || $0 == "Khemni Chak" }.count
    }
    var body: some View {
        VStack{
                VStack(alignment: .leading) {
                    HStack {
                        Button(
                            action: {
                                showRouteView = false
                                source = ""
                                destination = ""
                            }
                           
                        ) {
                            Image(systemName: "xmark")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .padding(.horizontal)
                        }
                        Text("Route Details")
                            .font(.largeTitle.bold())
                            .foregroundColor(.white)
                        Spacer()
                       
                    }
                    .padding(.top,35)
                    HStack{
                        RouteinfoView(backgroundColr: false, imageName: "mappin.and.ellipse", title: source, info: "")
                        Image(systemName: "arrow.right")
                        RouteinfoView(backgroundColr: false ,imageName: "mappin.and.ellipse", title: destination, info: "")
                    }
                    HStack{
                        RouteinfoView(backgroundColr: true ,imageName: "indianrupeesign", title: "Rupees", info: "0")
                        RouteinfoView(backgroundColr: true,imageName: "clock", title: "Mins", info: "0")
                    }
                    HStack{
                        RouteinfoView(backgroundColr: true,imageName: "map", title: "station", info: "\(route.count)")
                        RouteinfoView(backgroundColr: true,imageName: "arrow.up.arrow.down", title: "Line change", info: "\(interchangeCount)")
                       
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color(hex: "#1eacfa"))
                .cornerRadius(10)
                .font(.subheadline)
                ScrollView{
                    VStack(alignment: .leading,spacing: 0) {
                        ForEach(Array(route.enumerated()), id: \.offset) { index, station in
                            VStack(alignment: .leading,spacing: 0){
                                HStack {
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color(hex: "#1eacfa"))
                                        .frame(width: 50, height: 50)
                                        .overlay {
                                            Text("\(index + 1)")
                                                .foregroundColor(.white)
                                        }
                                    Text(station)
                                        .font(.headline)
                                }
                                .padding(.horizontal)
                                if (index + 1 < route.count){
                                    Image("RedLine")
                                        .resizable()
                                        .frame(width: 25, height: 40)
                                        .padding(.horizontal,26)
                                }
                                    
                            }
                        }
                        
                    }.padding(.vertical)
                }
               
                .frame(maxWidth: .infinity, minHeight: 200,alignment: .leading)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(10)
                .scrollIndicators(.hidden)
            }
        .ignoresSafeArea(.all)
    }
   
}
struct RouteinfoView: View {
    var backgroundColr: Bool
    let imageName: String
    let title: String
    let info: String?
    var body: some View {
        HStack{
            Image(systemName: imageName)
            if let info  = info{
                Text("\(info)")
            }
            Text(title)
                .font(backgroundColr ? .caption : .headline)
            
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            backgroundColr ? AnyShapeStyle(.ultraThinMaterial) : AnyShapeStyle(.clear)
        )
        
        
    }
}
//MarkDown #Preview

#Preview{
    MetroNavigationView()
//    RouteDetailView(source: .constant("patna junction"), destination: .constant("Rajender Nagar"), route: .constant(["23","2ss","Ramkrishna Nagar","patna zoo","patna college"]), showRouteView: .constant(true) )
//    SearchableTextField(title: "Enter textfield", text: .constant("this is text"), options: ["option1","option2","option3","option4","option5"], showDropdown: .constant(true), otherDropdown: .constant(false))
//    RouteinfoView(backgroundColr: false, imageName: "indianrupeesign", title: "Rupees", info: "0")

}
