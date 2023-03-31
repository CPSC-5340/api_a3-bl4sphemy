//
//  DretailsView.swift
//  Assignment3
//
//  Created by Brian Rawlins on 3/26/23.
//

import SwiftUI

struct IpDetail: View {
    
    var ipinfo : IpModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("IP: " + ipinfo.ip)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                Text("Hostname: " + ipinfo.hostname)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text("City: " + ipinfo.city)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text("Region: " + ipinfo.region)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text("Country: " + ipinfo.country)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text("Location: " + ipinfo.loc)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text("Org: " + ipinfo.org)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text("Zio Code: " + ipinfo.postal)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text("Time Zone: " + ipinfo.timezone)
                    .font(.system(size: 15))
                    .padding(.horizontal)
            }
        }
    }
}

//struct DretailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        IpDetail()
//    }
//}
