import ShellOut
import ArgumentParser

struct Command: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Вызов коммнды", subcommands: [Push.self])
}

extension Command {
    struct Push: ParsableCommand {
        @Argument()
        var commitName: String
        
        @Option(wrappedValue: "master")
        var branch: String
        
        func run() throws {
            try shellOut(to: .gitCommit(message: commitName))
            try shellOut(to: "git push origin \(branch)")
        }
    }
}

Command.main()

