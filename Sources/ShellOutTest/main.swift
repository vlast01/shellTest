import ShellOut
import ArgumentParser

struct Command: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Вызов коммнды", subcommands: [Push.self, Createbrunch.self])
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
    
    struct Createbrunch: ParsableCommand {
        @Argument()
        var branchName: String
        
        func run() throws {
            try shellOut(to: "git checkout -b \(branchName)")
        }
    }
}

Command.main()

