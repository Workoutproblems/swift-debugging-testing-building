import UIKit
import PlaygroundSupport

// Since dealing with HTTP is asynchronous, the Playground needs "indifinite execution"
// in order to get the response back and use it
PlaygroundPage.current.needsIndefiniteExecution = true


struct InnovationIdea {
    let title: String
    let description: String
    let isDraft: Bool
    let submittedBy: String
}

let url = URL(string: "https://andrewcbancroft.github.io/pluralsight/iosdpbp/InnovationIdeas.json")

let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
    
}

task.resume()
