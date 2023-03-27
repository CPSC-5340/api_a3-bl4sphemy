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
                Text("Testing1")
                //Text(ipvm.getData())
                ForEach(ipvm.IpData) { ipinfo in
                    NavigationLink {
                        Text("Testing")
                        Text(ipinfo.ip)
                        IpDetail(ipinfo: ipinfo)
                    } label: {
                        Text(ipinfo.ip)
                    }
                }
                
            }
            .task {
                ipvm.fetchData()
                //await ipvm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("IP")
            .alert(isPresented: $ipvm.hasError, error: ipvm.error) {
                Text("")
            }
        }
    //
        
    }
}

struct IpView_Previews: PreviewProvider {
    static var previews: some View {
        IpView()
    }
}
