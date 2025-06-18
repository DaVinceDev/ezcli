# EzCLI - Create zig cli apps easly 🍃

**EzCli** is a package meant for speeding up cli development in zig for **small** applications.

## Usage ⚙️

Check out the main file!

# Instalation

1º Create a zig project and nav to it

2º Go to the release page and copy the url of the package. Example: ``` <somethingsomethingVx>.zip ````

3º Do ```zig fetch --save <url>```

4º Add as a dependency:

```zig

    const ezcli = b.dependency("ezcli", .{ .target = target, .optimize = optimize });

    exe.root_module.addImport("ezcli", ezcli.module("ezcli"));

```

And there you go! Tip: compile without writing any code to make sure it's all OK.

# Status 🧪

**Still under (active) development**

Working on multiple commands and flags
