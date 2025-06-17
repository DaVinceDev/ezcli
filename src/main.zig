// usage example
const std = @import("std");
const ezcli = @import("ezcli");

pub fn main() void {
    const allocator = std.heap.page_allocator;
    var sayHiCli = ezcli.App.init("sayHi", "Only says...", allocator);
    defer sayHiCli.deinit();

    try sayHiCli.AddCommand("hi", sayHi);
    try sayHiCli.AddCommand("hello", sayHello);
}

fn sayHi() void {
    std.debug.print("Hi!\n", .{});
}

fn sayHello() void {
    std.debug.print("Hello!!\n", .{});
}
