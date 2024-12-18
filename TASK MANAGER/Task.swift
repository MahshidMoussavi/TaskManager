import Foundation

struct Task: Identifiable {
    let id = UUID()
    let date: Date
    let title: String
    let category: String
}
