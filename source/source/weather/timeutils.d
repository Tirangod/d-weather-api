module weather.timeutils;

import std.datetime;
import std.string;
import std.conv;

TimeOfDay timeOfDayFromHHMMXM(string str) {
    import std.stdio;

    string xm = str[$-2..$];

    int hour = to!int(str[0..2]);
    int minute = to!int(str[3..5]);

    if (xm == "PM") {
        hour += 12;
    } else if (xm != "AM") {
        throw new TimeException("Incorrect XM (has to be AM or PM)");
    }

    return TimeOfDay(hour, minute, 0);
}

DateTime dateTimeFromISOExtString(string str) {
    return DateTime.fromISOExtString(str.tr(" ", "T")~":00");
}