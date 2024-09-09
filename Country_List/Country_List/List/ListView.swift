//
//  ListView.swift
//  Country_List
//
//  Created by vishwas ng on 17/07/24.
//

import SwiftUI
import SwiftData

struct ListView: View {
    @Bindable var cu: Country
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 50){
            Image(uiImage: cu.viewCountryImage)
                .resizable()
                .frame(width: 150, height: 150)
                .cornerRadius(3.0)
            VStack(alignment:.leading) {
                Text(cu.country)
                    .font(.largeTitle.bold())
                Text(cu.state)
                    .font(.headline.italic())
            }
        }.padding()
            .ignoresSafeArea()
            .onTapGesture(perform: {
                cu.state = "\(cu.state) - visited"
            })
    }
    
    
}

#Preview {
    let container = try! ModelContainer(for: Country.self,                                        configurations: ModelConfiguration(isStoredInMemoryOnly: true))
    let country = Country(country: "India", state: "Karnataka", flag: "in")
    container.mainContext.insert(country)
    
    return ListView(cu: country)
}
