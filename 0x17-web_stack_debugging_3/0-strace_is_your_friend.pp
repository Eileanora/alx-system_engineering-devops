# this script is used to fix the web server by fixing a typo in file name in file wp-setting.php
$file = '/var/www/html/wp-settings.php'
exec { 'replace':
  command => "sed -i 's/phpp/php/g' $file",
  path    => ['/bin', '/usr/bin']
}
