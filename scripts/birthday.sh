cat ~/exportAdrBook20120104.csv | 
    sed '1d' |                                                                         # 1
    sed -e 's/"[^"]*"//g' |                                                            # 2 
    awk -F, '$31 !~"^$" {print $0}' |                                                  # 3 
    cut -d, -f1,2,30-32 |                                                              # 4
    sort -g -t, -k4 -k5 |                                                              # 5
    awk -F, 'BEGIN {OFS=""} {printf "%0.2d/%0.2d/%4d %s %s\n", $5, $4, $3, $1, $2}'    # 6
