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
        NavigationView {
            List {
                NavigationLink {
                    
                } label: {
                    Text(ipvm.IpData!.ip)
                }
                
//                ForEach(ipvm.IpData) { data in
//                    NavigationLink {
//                        IpDetail(ipinfo: data)
//
//                    } label: {
//                    }
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
//}


struct IpView_Previews: PreviewProvider {
    static var previews: some View {
        IpView()
    }
}
