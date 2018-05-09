#!/bin/sh                                                                       
                                                                                
USAGE_LINE="Usage: ./demo.sh <KEY_FILE> <POLLING(us)> <ENC_BLOCK(b)> <ENCODER> "
                                                                                
if test $# != 6; then                                                           
    echo 'All 6 arguments are required!'                                        
    echo "$USAGE_LINE"                                                          
    exit 1                                                                      
fi                                                                              
                                                                                
gst-launch-1.0 -q autovideosrc ! queue ! videoconvert ! $4 ! fdsink \           
| aes128 -k "$1" -p "$2" -f "$3" \                                              
| nc "$5" "$6"

