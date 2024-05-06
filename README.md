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
important reference : https://sarcasm.github.io/notes/dev/compilation-database.html#text-editors-and-ides
