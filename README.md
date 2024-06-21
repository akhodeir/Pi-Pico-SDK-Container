# Pi-Pico-SDK-Container
SDK container that can compile and debug

#Combination of multi repo
#https://github.com/lukstep/raspberry-pi-pico-docker-sdk/blob/main/Dockerfile
#https://github.com/shabaz123/rp2040tools/blob/main/pico-docker-steps.txt

settings.json

```
{
    "C_Cpp.intelliSenseEngine": "Disabled",
    //"clangd.path": "/usr/bin/clangd",
    "clangd.checkUpdates": false,
    "clangd.restartAfterCrash": true,
    "clangd.detectExtensionConflicts": true,
    "clangd.arguments": ["-log=verbose", 
                         "-pretty", 
                         "--clang-tidy",
                         "--background-index", 
                         //"--query-driver=/usr/bin/clang",
                         "--enable-config",
                         "--compile-commands-dir=${workspaceFolder}"]
                            
}
```
tasks.json
```
{
         "label": "mybuild",
         "type": "shell",
         "command": "mkdir -p ${workspaceFolder}/output; make ABCD 2>&1 | tee ${workspaceFolder}/output/build_log",
         "options": {
            "cwd": "${workspaceFolder}/path1"
         },
         "problemMatcher": {
            "owner": "cpp",
            "fileLocation": [
               "relative",
               "${workspaceFolder}/path2"
            ],
            "pattern": {
               "regexp": "^(.*):(\\d+):(\\d+):\\s+(warning|error|fatal error):\\s+(.*)$",
               "file": 1,
               "line": 2,
               "column": 3,
               "severity": 4,
               "message": 5
            }
         },
         "presentation": {
            "panel": "dedicated",
            "clear": true
         },
      },
                            
}
```

important reference : https://sarcasm.github.io/notes/dev/compilation-database.html#text-editors-and-ides
