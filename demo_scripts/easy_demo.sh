#!/bin/sh                                                                       
                                                                                
if test $# != 1 ; then                                                          
    echo 'USAGE: ./easy_demo.sh <IP_ADDR>'                                      
    exit 1                                                                      
fi                                                                              
                                                                                
if test -c "/dev/rsvmem" ; then                                                 
    echo 'Physical memory for DMA had been allocated.'                          
else                                                                            
    echo 'Allocating physical memory buffer for DMA transfer in the kernel...'  
    ./dma.sh                                                                    
fi                                                                              
                                                                                
./demo.sh key 50 16384 avenc_mjpeg $1 5000 
