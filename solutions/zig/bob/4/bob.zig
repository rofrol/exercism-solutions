const std = @import("std");
const ascii = std.ascii;

pub fn response(r: []const u8) []const u8 {
    const s = std.mem.trim(u8, r, &ascii.whitespace);
    if (s.len == 0) return "Fine. Be that way!";
    const is_question = s[s.len - 1] == '?';
    var is_upper = all_upper(s);
    if (is_upper and is_question) return "Calm down, I know what I'm doing!";
    if (is_upper) return "Whoa, chill out!";
    if (is_question) return "Sure.";
    return "Whatever.";
}

fn all_upper(s: []const u8) bool {
    var is_upper = false;
    for (s) |c| {
        if (ascii.isAlphanumeric(c)) {
            if (ascii.isLower(c)) {
                return false;
            }
            if (ascii.isUpper(c)) is_upper = true;
        }
    }
    return is_upper;
}
