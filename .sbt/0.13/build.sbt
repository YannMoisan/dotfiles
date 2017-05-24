//libraryDependencies += "com.lihaoyi" % "ammonite" % "0.8.0" % "test" cross CrossVersion.full

//initialCommands in (Test, console) := """ammonite.Main().run()"""

//net.virtualvoid.sbt.graph.Plugin.graphSettings
triggeredMessage in ThisBuild := Watched.clearWhenTriggered
cancelable in Global := true
