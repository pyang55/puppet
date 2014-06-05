node default{
class{'motd':}
package{'net-snmp':
ensure => installed;
}
service{'snmpd':
ensure => true;
}
notify{"Hello ${fqdn}":}

}
