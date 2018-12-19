
#Variaveis
$instalar = ["vim","figlet"]

package { $instalar:
	ensure => present
}

#command
exec { 'memoria_free':
	command => '/usr/bin/free -h > /root/memfree'
}

#Copiar arquivo, primeiro destino, origem source#
file { '/tmp/memfree' :
	source => "/root/memfree",
	ensure => present
}

service { 'cron' :
	enable => false,
	ensure => stopped
}
