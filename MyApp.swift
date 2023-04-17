import SwiftUI

@main
struct MyApp: App {
    @StateObject var exerciseModel = ExerciseModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(exerciseModel)
        }
    }
}
