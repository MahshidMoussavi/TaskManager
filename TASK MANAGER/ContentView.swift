import SwiftUI

struct ContentView: View {
    @State private var searchText = ""
    @State private var selectedDate = Date()
    @State private var tasks: [Task] = [
        Task(date: Date(), title: "Review upcoming exam dates and plan ahead", category: "Education"),
        Task(date: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, title: "Take the productivity method quiz", category: "Productivity")
    ]
    @State private var doneTasks: [Task] = []

    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().backgroundColor = UIColor.systemBackground
    }

    var body: some View {
        TabView {
            HomeView(searchText: $searchText, selectedDate: $selectedDate, tasks: $tasks, doneTasks: $doneTasks)
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            DoneView(tasks: $tasks, doneTasks: $doneTasks)
                .tabItem {
                    Label("Done", systemImage: "checkmark.circle")
                }
        }
        .font(.custom("AvenirNext-DemiBold", size: 12))
        .accentColor(Color(red: 160 / 255, green: 99 / 255, blue: 114 / 255)) // Custom color
    }
}
