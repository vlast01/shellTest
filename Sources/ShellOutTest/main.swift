import ShellOut
import ArgumentParser

struct Command: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Вызов команды", subcommands: [Push.self, Createbrunch.self, Gitinit.self, Openfile.self, Createandopenfile.self])
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
    
    struct Gitinit: ParsableCommand {
        func run() throws {
            try shellOut(to: .gitInit())
        }
    }
    
    struct Openfile: ParsableCommand {
        func run() throws {
            try shellOut(to: .openFile(at: "README.md"))
        }
    }
    
    struct Createandopenfile: ParsableCommand {
        func run() throws {
            try shellOut(to: .createFile(named: "file", contents: "Hello world"))
            try shellOut(to: .openFile(at: "file"))
        }
    }
}

Command.main()

