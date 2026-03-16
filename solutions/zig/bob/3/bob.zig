const std = @import("std");
const ascii = std.ascii;

pub fn response(r: []const u8) []const u8 {
    const s = std.mem.trim(u8, r, &ascii.whitespace);
    if (s.len == 0) return "Fine. Be that way!";
    const question = s[s.len - 1] == '?';
    var allCaps = upper(s);
    if (allCaps and question) return "Calm down, I know what I'm doing!";
    if (allCaps) return "Whoa, chill out!";
    if (question) return "Sure.";
    return "Whatever.";
}

fn upper(s: []const u8) bool {
    var allCaps = false;
    for (s) |c| {
        if (ascii.isAlphanumeric(c)) {
            if (ascii.isLower(c)) {
                allCaps = false;
                break;
            }
            if (ascii.isUpper(c)) allCaps = true;
        }
    }
    return allCaps;
}
