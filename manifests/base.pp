node "default" {
  include apache
  #Class["proxy"] -> Class["apache::app"]
}

node /proxy1/ {
  include proxy
  include apache::app
  include apache::service
  include apache::config
  Class["proxy"] -> Class["apache::app"] -> Class["apache::config"]
}

node /web/ {
  include proxy
  include apache::app
  include apache::service
  include apache::index
  Class["proxy"] -> Class["apache::app"] -> Class["apache::index"]
}
