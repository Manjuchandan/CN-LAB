set ns [new Simulator]
set error_rate 0.00
set nf [open prog6.nam w]
$ns namtrace-all $nf
set nd [open prog6.tr w]
$ns trace-all $nd

proc finish { } {
global ns nf nd
$ns flush-trace
close $nf
close $nd
exec awk -f 6.awk prog6.tr &
exec nam prog6.nam &
exit 0
}

set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]

$ns duplex-link $n0 $n2 2Mb 10ms DropTail
$ns duplex-link $n1 $n2 2Mb 10ms DropTail
$ns simplex-link $n2 $n3 1Mb 100ms DropTail
$ns simplex-link $n3 $n2 1Mb 100ms DropTail

set lan [$ns newLan "$n3 $n4 $n5" 0.5Mb 40ms LL Queue/DropTail MAC/802_3 Channel]

$ns duplex-link-op $n0 $n2 orient right-down
$ns duplex-link-op $n1 $n2 orient right-up
$ns simplex-link-op $n2 $n3 orient right

$ns queue-limit $n2 $n3 20
$ns simplex-link-op $n2 $n3 queuePos 0.5

set loss_module [new ErrorModel]
$loss_module ranvar [new RandomVariable/Uniform]
$loss_module drop-target [new Agent/Null]
$loss_module set rate_ $error_rate
$ns lossmodel $loss_module $n2 $n3


set tcp [new Agent/TCP]
$ns attach-agent $n0 $tcp

set ftp [new Application/FTP]
$ftp attach-agent $tcp
$ftp set type_ FTP

set sink0 [new Agent/Null]
$ns attach-agent $n4 $sink0
$ns connect $tcp $sink0
$tcp set fid_ 1


set udp [new Agent/UDP]
$ns attach-agent $n1 $udp

set cbr [new Application/Traffic/CBR]
$cbr set packetSize_ 450
$cbr set interval_ 0.005
$cbr attach-agent $udp

set sink1 [new Agent/Null]
$ns attach-agent $n5 $sink1
$ns connect $udp $sink1

$ns at 0.1 "$cbr start"
$ns at 1.0 "$ftp start"
$ns at 124.0 "$ftp stop"
$ns at 124.5 "$cbr stop"
$ns at 125.0 "finish"
$ns run

