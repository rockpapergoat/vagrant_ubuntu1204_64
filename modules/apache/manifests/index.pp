class apache::index {

  file {"/var/www/index.html":
    ensure => file,
    content => template("apache/${hostname}.html.erb"),
   }
}
