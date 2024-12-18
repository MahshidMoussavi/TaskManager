import SwiftUI

struct CreateTaskView: View {
    @Binding var tasks: [Task]
    @Environment(\.dismiss) private var dismiss
    @State private var taskName = ""
    @State private var taskCategory = ""
    @State private var taskDate = Date()

    var body: some View {
        NavigationView {
            Form {
                TextField("Task Name", text: $taskName)
                TextField("Category", text: $taskCategory)
                DatePicker("Date", selection: $taskDate, displayedComponents: .date)
            }
            .navigationTitle("Create Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !taskName.isEmpty && !taskCategory.isEmpty {
                            let newTask = Task(date: taskDate, title: taskName, category: taskCategory)
                            tasks.append(newTask)
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}
