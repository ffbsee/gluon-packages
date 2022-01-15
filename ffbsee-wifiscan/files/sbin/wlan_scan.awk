/^BSS/ {
    mac = gensub ( /^BSS[[:space:]]*([0-9a-fA-F:]+).*?$/, "\\1", "g", $0 );
}
/^[[:space:]]*signal:/ {
    signal = gensub ( /^[[:space:]]*signal:[[:space:]]*(\-?[0-9.]+).*?$/, "\\1", "g", $0 );
}
/^[[:space:]]*\* primary channel:/ {
    channel = gensub (/^[[:space:]]*\* primary channel:[[:space:]]*(\-?[0-9.]+).*?$/, "\\1", "g", $0);
}
/^[[:space:]]*SSID:/ {
    ssid = gensub ( /^[[:space:]]*SSID:[[:space:]]*([^\n]*).*?$/, "\\1", "g", $0 );
    printf ( "{\"ssid\": \"%s\", \"mac\": \"%s\", \"signal\": %s, \"channel\": \"%s\"},\n", ssid, mac, signal, channel);
}
