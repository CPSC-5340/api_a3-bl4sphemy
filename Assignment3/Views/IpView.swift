//
//  IpView.swift
//  Assignment3
//
//  Created by Brian Rawlins on 3/26/23.
//

import SwiftUI

struct IpView: View {
    
    @ObservedObject var ipvm = IpViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                
                ForEach(ipvm.IpData) { ipinfo in
                    NavigationLink {
                        Text("argh")
                        Text(ipvm.IpData[1].ip)
                        IpDetail(ipinfo: ipinfo)

                    } label: {
                        Text(ipvm.IpData[0].ip)
                    }
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("IP")
            .alert(isPresented: $ipvm.hasError, error: ipvm.error) {
                Text("")
            }
            .onAppear() {
                ipvm.fetchData()
            }
        }
        
    }
}


struct IpView_Previews: PreviewProvider {
    static var previews: some View {
        IpView()
    }
}
