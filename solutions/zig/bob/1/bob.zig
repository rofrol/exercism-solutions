const std = @import("std");
const ascii = std.ascii;

pub fn response(r: []const u8) []const u8 {
    const s = std.mem.trim(u8, r, " \t\r\n");
    if (s.len == 0) return "Fine. Be that way!";
    var hasLowerAlpha = false;
    const hasQuestionMarkAtTheEnd = s[s.len - 1] == '?';
    var empty = true;
    var allCaps = false;
    for (s) |c| {
        if (c != ' ' and c != '\t') empty = false;
        if (ascii.isLower(c) and ascii.isAlphanumeric(c)) {
            hasLowerAlpha = true;
            allCaps = false;
        }
        if (ascii.isAlphanumeric(c) and ascii.isUpper(c) and !hasLowerAlpha) allCaps = true;
    }
    if (empty) return "Fine. Be that way!";
    if (allCaps and hasQuestionMarkAtTheEnd) return "Calm down, I know what I'm doing!";
    if (allCaps) return "Whoa, chill out!";
    if (hasQuestionMarkAtTheEnd) return "Sure.";
    return "Whatever.";
}
