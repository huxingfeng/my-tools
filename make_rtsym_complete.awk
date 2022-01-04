
/:/{
    this_line_addr = strtonum(substr($1,0,12));

    # Deal with the "*" lines
    if (this_line_addr != 0 && (this_line_addr - last_line_addr) != 16) {
        # there are possiably multiple lines between last line and this line
        num_of_line = (this_line_addr - last_line_addr - 16) / 16;
        for (i = 0; i < num_of_line; i++) {
            print last[0],last[1],last[2],last[3];
        }
    }
    # Deal with this line
    print $2,$3,$4,$5;

    # save the last line
    last_line_addr = this_line_addr;
    last[0] = $2;
    last[1] = $2;
    last[2] = $4;
    last[3] = $5;
}

