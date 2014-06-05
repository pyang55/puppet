class snmpd {

  File {
    require  => Package["net-snmp"]
  }

  package { "net-snmp": ensure  => installed }
  package { "net-snmp-utils": ensure => installed }

  service { snmpd: ensure => running, enable => true }

  file { "/etc/snmp/snmpd.conf":
    content => template("snmpd/etc/snmp/snmpd.conf.erb"),
    mode => 600,
    notify => Service[snmpd] 
  }

  $options_file  = $operatingsystemrelease ? {
        /^6\./  => "/etc/sysconfig/snmpd",
        /^201/  => "/etc/sysconfig/snmpd",  # AMZN instances
        default  => "/etc/sysconfig/snmpd.options"
  }

  file { $options_file:
    content => template("snmpd/etc/sysconfig/snmpd.options.erb"),
    notify => Service[snmpd] 
  }

}
