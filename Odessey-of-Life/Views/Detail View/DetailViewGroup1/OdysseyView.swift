    //
    //  OdysseyView.swift
    //  Odessey-of-Life
    //
    //  Created by Roshan Ekka on 31/03/24.
    //

    /* view of common */
    import SwiftData
    import SwiftUI

//    extension View {
//        func hideKeyboard(){
//            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//            
//            
//            //hides keyboard
//            // implement that when the text field empty then dont save if something typed then save it
//            
//        }
//    }

    struct OdysseyView: View {
        
        @EnvironmentObject var navigationManager: navStateManager
        @EnvironmentObject var dataManager : ModelDataManager
        
        @Environment(\.modelContext) var modelContext

        @Query var dailyNotes: [journalDataModel]
        // for updating
        @State var noteExisting : journalDataModel?
        
        @State private var path = [journalDataModel]()
        
        @State private var selectedTab = 0
        @State private var selectedDate: Date? = nil // Selected date
        
        @FocusState var noteFocussed: Bool
        
        
        let passedVar : menu1
        
        var body: some View {
            
            VStack {
                switch passedVar.menuNo {
                    case 1:
                    GeometryReader { geometry in
                        HStack(spacing: 0) {
                                Group{
                                    if(selectedTab==0) {
                                        DateView(selectedDate: $selectedDate, dateEntry: Date())
                                    }
                                    else {
                                        ExclusiveView()
                                    }
                                }
                                .frame(width: 350)
    //                                Spacer()
                            TodayView(selectedDate: $selectedDate, editNote: journalDataModel(entryNote: "", entryDate: Date()), noteFocussed: $noteFocussed)
                                .onTapGesture {
                                    noteFocussed = false
                                }
                            }
                        }

                    VStack{
                        TabView(selection: $selectedTab){
                            //                        Spacer()
                            Text("")
                                .tag(0)
                                .tabItem {
                                    Label("Date", systemImage: "calendar")
                                    Text("Tab 1", comment: "Tab bar title")
                                }
                            //                        Spacer()
                            Text("")
                                .tag(1)
                                .tabItem {
                                    Label("Motivation", systemImage: "sparkles")
                                    Text("Tab 1", comment: "Tab bar title")
                                }
                            
                        }
                    }.frame(height: 40)
                    case 2:
                        AspectsView()
                    case 3:
                        MemoriesView()
                    default:
                        EmptyView()
                    }
                
            }
        }
    }

    //#Preview {
    //    OdysseyView(passedVar: menu1Items[1])
    //}
