//
//  CountryScreen.swift
//  Country_List
//
//  Created by vishwas ng on 17/07/24.
//

import SwiftUI
import SwiftData

struct CountryScreen: View {
    
    @Environment(\.modelContext) private var lmodelContext
    
    let country = ["India", "Afghanistan", "Korea", "Zimbabwe", "USA", "Nepal", "Australia"]
    let state = ["Karnataka","Kabul", "Seoul", "Harare", "Texas", "Katmandu", "Perth"]
    let flag = ["in","af", "kr", "zw", "us", "np", "au"]
    
    
    @State private var orderAscending = true
    @Query(sort: \Country.country, order:.forward) var countryData: [Country]
    @Query(filter: #Predicate<Country> {$0.country == "Afghanistan"})  var filteredCountryData: [Country]
    
    private var reArrangedCountry:[Country] {
        return countryData.sorted { orderAscending ? $0.country < $1.country : $0.country > $1.country
        }
    }
    
    var body: some View {
        NavigationStack {
            List() {
                Section("Sorting") {
                    ForEach(countryData, id: \.self) { ldata in
                        NavigationLink {
                            ListView(cu: ldata)
                                .modifier(CustomBackgroundModifier())
                        } label: {
                            listView(ldata: ldata)
                        }
                    }.onDelete(perform: { indexSet in
                        lmodelContext.delete(countryData[indexSet.first ?? 1])
                    })
                }
                Section("Filtering") {
                    ForEach(filteredCountryData, id: \.self) { ldata in
                        NavigationLink {
                            ListView(cu: ldata)
                                .modifier(CustomBackgroundModifier())
                        } label: {
                            listView(ldata: ldata)
                        }
                    }
                }
            }.listStyle(.grouped)
                .listRowBackground(Color.clear)
                .listRowInsets(.none)
            Button("Add Country") {
                let num = Int.random(in: 0..<7)
                print(num)
                let country = Country(country: country[num], state: state[num], flag: flag[num])
                lmodelContext.insert(country)
            }
            .navigationTitle("Countries")
            .toolbar {
                Button("", systemImage: orderAscending ? "arrow.down" : "arrow.up") {
                    orderAscending.toggle()
                }
            }
        }
    }
    
    func listView(ldata:Country) -> some View{
        return  HStack(spacing:25) {
            Image(uiImage: ldata.viewCountryImage)
                .resizable()
                .frame(width:40, height: 40)
            VStack(alignment: .leading) {
                Text(ldata.country)
                    .font(.title2)
                Text(ldata.state)
                    .font(.title3)
            }
            Spacer()
        }
    }
}

#Preview {
    CountryScreen()
        .modelContainer(Country.preview)
}
