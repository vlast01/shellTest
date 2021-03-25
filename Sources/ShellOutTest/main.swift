import ShellOut

//try shellOut(to: "echo", arguments: ["Hello world"])
//try shellOut(to: .buildSwiftPackage())
//print(try shellOut(to: .openFile(at: "Project.xcodeproj")))

//try shellOut(to: .gitInit())
try shellOut(to: .gitCommit(message: "A scripted commit!"))
//
//print(try shellOut(to: "pwd"))
//print(try shellOut(to: "cd .."))
//print(try shellOut(to: "pwd"))

//try shellOut(to: .createFolder(named: "folder"))
