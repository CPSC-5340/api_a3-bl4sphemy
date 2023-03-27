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
                Text(ipinfo.ip)
                    .font(.system(size: 20))
                    .padding(.horizontal)
                Text(ipinfo.hostname)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text(ipinfo.city)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text(ipinfo.region)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text(ipinfo.country)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text(ipinfo.loc)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text(ipinfo.org)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text(ipinfo.postal)
                    .font(.system(size: 15))
                    .padding(.horizontal)
                Text(ipinfo.timezone)
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
