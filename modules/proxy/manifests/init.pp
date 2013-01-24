class proxy {
   file {"/etc/apt/apt.conf":
   ensure => present,
   }

case $proxy {
	/^[http]/: {
		file_line {"apt.conf":
	   line => "Acquire::http::Proxy \"${proxy}\";",
	   path => "/etc/apt/apt.conf",
	   }
	}
	default: {
		notify {"no proxy env variable present": }
		}
	}
}
