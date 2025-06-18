// usage example
const std = @import("std");
const ezcli = @import("ezcli");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    //Initialize a new cli app
    var sayHiCli = ezcli.App.init("sayHi", "Only says...", allocator);
    defer sayHiCli.deinit();

    // Add commands to your app
    try sayHiCli.AddCommand("hi", sayHi);
    try sayHiCli.AddCommand("hello", sayHello);

    // Read args
    const args = try std.process.argsAlloc(allocator);
    defer allocator.free(args);

    // Get first command
    const command = args[1];

    // Pass the command
    try sayHiCli.Run(command);
}

fn sayHi() void {
    std.debug.print("Hi!\n", .{});
}

fn sayHello() void {
    std.debug.print("Hello!!\n", .{});
}
