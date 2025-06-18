const std = @import("std");

pub const App = struct {
    name: []const u8,
    description: []const u8,
    commandList: std.StringHashMap(*const fn () void),

    // Initializes your app
    pub fn init(name: []const u8, description: []const u8, allocator: std.mem.Allocator) App {
        return .{
            .name = name,
            .description = description,
            .commandList = std.StringHashMap(*const fn () void).init(allocator),
        };
    }

    pub fn deinit(self: *App) void {
        self.commandList.deinit();
    }

    /// Adds a command to your application
    /// `commandName` -> your command
    /// `fun` -> function to execute your command
    pub fn AddCommand(self: *App, commandName: []const u8, fun: *const fn () void) !void {
        try self.commandList.put(commandName, fun);
    }

    /// Runs the function based on the `command`
    /// If a unknow command is provided, it returns a message to indicate it
    pub fn Run(self: *App, commandName: []const u8) !void {
        const func = self.commandList.get(commandName);
        if (func) |f|
            f()
        else
            std.debug.print("Command not found. Try 'help' to print a list of commands.\n", .{});
    }
};
