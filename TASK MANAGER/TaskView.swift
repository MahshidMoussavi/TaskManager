import SwiftUI

struct TaskView: View {
    let task: Task
    let markAsDone: (Task) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            HStack {
                // Tap-enabled Circle
                Button(action: {
                    markAsDone(task)
                }) {
                    Circle()
                        .strokeBorder(Color(red: 160 / 255, green: 99 / 255, blue: 114 / 255), lineWidth: 2) // Custom color
                        .frame(width: 24, height: 24)
                }

                VStack(alignment: .leading) {
                    Text(task.title)
                        .font(.headline)
                    Text(task.category)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(8)
            .shadow(color: Color(.systemGray4), radius: 2, x: 0, y: 1)
            .padding(.horizontal)
        }
    }
}
