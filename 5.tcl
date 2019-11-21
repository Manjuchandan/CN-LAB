set ns [new Simulator]
set nf [open prog5.nam w]
$ns namtrace-all $nf
set nd [open prog5.tr w]
$ns trace-all $nd

proc finish { } {
global ns nf nd
$ns flush-trace
 close $nf
close $nd
exec awk -f 5.awk prog5.tr &
exec nam prog5.nam &
exit 0
}

set n(0) [$ns node]
set n(1) [$ns node]
set n(2) [$ns node]
set n(3) [$ns node]
set n(4) [$ns node]
set n(5) [$ns node]

$ns duplex-link $n(0) $n(1) 0.3Mb 10ms DropTail
$ns duplex-link $n(1) $n(2) 0.3Mb 10ms DropTail
$ns simplex-link $n(2) $n(3) 0.3Mb 10ms DropTail
$ns simplex-link $n(3) $n(2) 0.3Mb 10ms DropTail

set lan [$ns newLan "$n(3) $n(4) $n(5)" 0.5Mb 40ms LL Queue/DropTail/Csma/Cd Channel]

$ns duplex-link-op $n(0) $n(1) orient right-down
$ns duplex-link-op $n(1) $n(2) orient right-up
$ns simplex-link-op $n(2) $n(3) orient right
$ns simplex-link-op $n(3) $n(2) orient left

set tcp [new Agent/TCP]
$ns attach-agent $n(0) $tcp

set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ftp set type_ FTP

set sink0 [new Agent/Null]
$ns attach-agent $n(4) $sink0
$ns connect $tcp $sink0
$tcp set fid_ 1


set udp [new Agent/UDP]
$ns attach-agent $n(1) $udp

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 450
$cbr set interval_ 0.005
$cbr attach-agent $udp

set sink1 [new Agent/Null]
$ns attach-agent $n(5) $sink1
$ns connect $udp $sink1

$ns at 0.3 "$cbr start"
$ns at 0.8 "$ftp start"
$ns at 7.0 "$ftp stop"
$ns at 7.5 "$cbr stop"
$ns at 8.0 "finish"
$ns run


