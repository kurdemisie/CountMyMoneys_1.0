//
//  ContentView.swift
//  CountMyMoneys_1.0
//
//  Created by Monika Herain on 3.10.2023.
//

import SwiftUI

struct MainTabView: View {
    
    @State var tabSelectionIndex = 1
    
    var body: some View {
        
        TabView(selection: $tabSelectionIndex) {
            

                    SettingsView()
                        .tabItem {
                            Image(systemName: "gearshape.fill")
                                
                        }
                        .tag(0)
                    
                    HomeView()
                        .tabItem {
                            Image(systemName: "house")
                        }
                        .tag(1)
                    
                    WritingsView()
                        .tabItem {
                            Image(systemName: "wineglass.fill")
                        }
                        .tag(2)
            
            
        }
        .environmentObject(ContentModel())
    }
}

#Preview {
    MainTabView()
}
