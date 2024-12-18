
import SwiftUI

struct DoneView: View {
    @Binding var tasks: [Task]
    @Binding var doneTasks: [Task]

    var body: some View {
        NavigationView {
            List {
                ForEach(doneTasks) { task in
                    VStack(alignment: .leading) {
                        Text(task.title).font(.headline)
                        Text(task.category).font(.subheadline).foregroundColor(.gray)
                    }
                    .swipeActions(edge: .trailing) {
                        Button(action: {
                            moveToToDoList(task)
                        }) {
                            Label("To-Do", systemImage: "arrow.uturn.left.circle")
                        }
                        .tint(Color(red: 160 / 255, green: 99 / 255, blue: 114 / 255))
                    }
                }
            }
            .navigationTitle("Done")
        }
    }

    func moveToToDoList(_ task: Task) {
        if let index = doneTasks.firstIndex(where: { $0.id == task.id }) {
            tasks.append(task)
            doneTasks.remove(at: index)
        }
    }
}
