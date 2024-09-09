//
//  CountryModel.swift
//  Country_List
//
//  Created by vishwas ng on 17/07/24.
//

import Foundation
import SwiftData
import UIKit

@Model
class Country:Identifiable {
    var uuid = UUID()
    var country:String
    var state:String
    var flag:String
    
    init(country: String, state: String, flag: String) {
        self.country = country
        self.state = state
        self.flag = flag
    }
}

extension Country {
    var viewCountryImage:UIImage {
        return UIImage(named: self.flag) ?? UIImage(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")!
    }
}


extension Country {
    @MainActor
    static var preview:ModelContainer {
        let container = try! ModelContainer(for: Country.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
        container.mainContext.insert(Country(country: "India", state: "Karnataka", flag: "in"))
        container.mainContext.insert(Country(country: "Zimbabwe", state: "Harare", flag: "zw"))
        return container
    }
}
