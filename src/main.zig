const std = @import("std");
const eql = std.mem.eql;

pub fn main() !void {
    var bananaCli = App.init("banana", "Says banana");

    var allocator = std.heap.page_allocator;
    const args = try std.process.argsAlloc(allocator);
    defer allocator.free(args);

    const command = args[1];

    if (eql(u8, command, "banana")) {
        try bananaCli.Command("banana", say);
    } else {
        std.debug.print("Command {s} not found! Try 'help' for all of the commands.\n", .{command});
    }
}

fn say() void {
    std.debug.print("Banana!", .{});
}

const App = struct {
    name: []const u8,
    description: []const u8,

    fn init(name: []const u8, description: []const u8) App {
        return .{
            .name = name,
            .description = description,
        };
    }

    /// Exectutes a funtion based on the name of the command
    fn Command(self: *App, commandName: []const u8, comptime fun: fn () void) !void {
        fun();
        _ = self;
        _ = commandName;
    }
};
