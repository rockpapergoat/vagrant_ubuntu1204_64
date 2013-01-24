class apache::config {

  include apache::app
  include apache::service
  
  file {"/etc/apache2/sites-enabled/000-default":
    ensure => file,
    content => template("apache/000-default.erb"),
  }
  
  
  file { "/etc/apache2/mods-enabled/proxy.conf":
    ensure => link,
    target => "/etc/apache2/mods-available/proxy.conf",
    require => File["/etc/apache2/mods-enabled/proxy.load"],
    notify  => Service["apache2"],
  }
  
  file { "/etc/apache2/mods-enabled/proxy.load":
    ensure => link,
    target => "/etc/apache2/mods-available/proxy.load",
    notify  => Service["apache2"],
  }
  
  file { "/etc/apache2/mods-enabled/proxy_balancer.conf":
    ensure => link,
    target => "/etc/apache2/mods-available/proxy_balancer.conf",
    require => File["/etc/apache2/mods-enabled/proxy_balancer.load"],
    notify  => Service["apache2"],
  }
  
  file { "/etc/apache2/mods-enabled/proxy_balancer.load":
    ensure => link,
    target => "/etc/apache2/mods-available/proxy_balancer.load",
    notify  => Service["apache2"],
  }

}
