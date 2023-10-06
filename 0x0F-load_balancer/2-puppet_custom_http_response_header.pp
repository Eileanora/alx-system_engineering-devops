$hostname = $::hostname

file { '/etc/nginx/conf.d/hostname.conf':
  ensure  => file,
  content => "
    server {
      listen 80 default_server;
      listen [::]:80 default_server;

      root /var/www/html;
      index index.html;

      server_name _;
      add_header X-Served-By ${hostname};

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
  subscribe => File['/etc/nginx/conf.d/hostname.conf'],
}
