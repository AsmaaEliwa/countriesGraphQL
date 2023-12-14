import SwiftUI
import CountryAPI // Assuming this contains the generated Apollo code

struct ContentView: View {
    @State var allCountries: [GetAllCountriesQuery.Data.Country] = []
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("All countries")
            
            List(allCountries, id: \.self) { country in
                Text("\(country.name ?? "") \(country.emoji ?? "")")
            }
        }
        .padding()
        .onAppear {
            DataManager.sharedInstance.fetchCountries { countries in
                self.allCountries = countries
            }
        }
    }
}
