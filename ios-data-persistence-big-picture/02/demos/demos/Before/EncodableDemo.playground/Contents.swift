import UIKit
import PlaygroundSupport

// Since dealing with HTTP is asynchronous, the Playground needs "indifinite execution"
// in order to get the response back and use it
PlaygroundPage.current.needsIndefiniteExecution = true


struct InnovationIdea: Encodable {
    let title: String
    let description: String
    let isDraft: Bool
    let submittedBy: String
}

let idea = InnovationIdea(title: "Swarm Teams",
                          description: "Allow us to form small teams to tackle problems...",
                          isDraft: true,
                          submittedBy: "Kathy")

let encoder = JSONEncoder()

do {
    let encoderIdea = try encoder.encode(idea)
    let jsonString = String(data: encoderIdea, encoding: .utf8)
} catch {
    print(error)
}
