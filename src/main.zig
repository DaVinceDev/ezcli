const std = @import("std");
const ezcli = @import("ezcli.zig");

pub fn main() !void {
    const allocator = std.heap.page_allocator;

    var bananaCli = ezcli.App.init("banana", "Says banana", allocator);
    defer bananaCli.deinit();

    const args = try std.process.argsAlloc(allocator);
    defer allocator.free(args);

    try bananaCli.AddCommand("help", help);
    try bananaCli.AddCommand("banana", say);

    const command = args[1];

    try bananaCli.Run(command);
}

fn say() void {
    std.debug.print("Banana!", .{});
}

fn help() void {
    std.debug.print("Help.", .{});
}
