node default{
class{'motd':}
package{'net-snmp':
ensure => installed;
}
service{'snmpd':
ensure => true;
}
class{'snmpd':}
notify{"Hello ${fqdn}":}

}
