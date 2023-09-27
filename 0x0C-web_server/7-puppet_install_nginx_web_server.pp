# puppet script to install nginx and do some basic configuration
package { 'nginx':
  ensure => present,
  before => File['/etc/nginx/sites-available/default'],
}

file { '/var/www/html/index.html':
    ensure  => file,
    content => 'Hello World!',
    require => Package['nginx'],
}

file { '/etc/nginx/sites-available/default':
    ensure  => file,
    content => "
        server {
        listen 80 default_server;
        listen [::]:80 default_server;

        root /var/www/html;
        index index.html;

        server_name _;

        location / {
            try_files \$uri \$uri/ =404;
        }

        location /redirect_me {
            return 301 https://www.youtube.com/watch?v=eCOdMdWbP_4;
        }
    }
    ",
    require => Package['nginx'],
}

service { 'nginx':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/nginx/sites-available/default'],
}
