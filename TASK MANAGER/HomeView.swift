import SwiftUI

struct HomeView: View {
    @Binding var searchText: String
    @Binding var selectedDate: Date
    @Binding var tasks: [Task]
    @Binding var doneTasks: [Task]
    @State private var isShowingCreateTaskModal = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    // Search Bar
                    TextField("Search for tasks...", text: $searchText)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .font(.system(size: 18))
                        .frame(height: 50)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)

                    // Full-Month Calendar View
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .padding()

                    // To-Do List
                    VStack(alignment: .leading, spacing: 10) {
                        Text("To-Do List")
                            .font(.title2)
                            .bold()
                            .padding(.horizontal)
                            .foregroundColor(Color(red: 160 / 255, green: 99 / 255, blue: 114 / 255))

                        if filteredTasks.isEmpty {
                            Text("No tasks found.")
                                .foregroundColor(.gray)
                                .padding()
                        } else {
                            ForEach(filteredTasks) { task in
                                TaskView(task: task, markAsDone: markAsDone)
                            }
                        }
                    }
                }
                .toolbar(content: {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            isShowingCreateTaskModal.toggle()
                        }, label: {
                            Image(systemName: "plus")
                                .font(.title3)
                                .foregroundColor(Color(red: 160 / 255, green: 99 / 255, blue: 114 / 255))
                        })
                        .sheet(isPresented: $isShowingCreateTaskModal) {
                            CreateTaskView(tasks: $tasks)
                        }
                    }
                })
                .padding(.vertical)
            }
            .navigationTitle("Home")
        }
    }

    func markAsDone(_ task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            doneTasks.append(task)
            tasks.remove(at: index)
        }
    }

    var filteredTasks: [Task] {
        tasks.filter { task in
            searchText.isEmpty || task.title.lowercased().contains(searchText.lowercased())
        }
    }
}
