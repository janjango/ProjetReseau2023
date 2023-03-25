hostname RD-RegionX
!
interface GigabitEthernet0/0
 ip address 10.0.X.1 255.255.255.0
 ipv6 address 2002:28d:dcX::1/64
!
interface GigabitEthernet0/1
 description Connexion vers le routeur de coeur
 ip address 192.168.X.1 255.255.255.0
 ipv6 address 2002:28d:dcX::1:1/64
!
interface GigabitEthernet0/2
 description Connexion vers les switchs locaux
 ip address 172.16.X.1 255.255.255.0
 ipv6 address 2002:28d:dcX::1:2/64
!
router ospf 1
 network 10.0.X.0 0.0.0.255 area 0
 network 192.168.X.0 0.0.0.255 area 0
 network 172.16.X.0 0.0.0.255 area 0
!
ipv6 router ospf 1
 router-id 10.0.X.1
 passive-interface default
 no passive-interface GigabitEthernet0/0
 no passive-interface GigabitEthernet0/1
 no passive-interface GigabitEthernet0/2
!
