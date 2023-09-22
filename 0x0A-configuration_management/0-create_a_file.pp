file { '/tmp/school':
    ensure  => 'file',
    path    => '/tmp/test.txt',
    owner   => 'www-data',
    group   => 'www-data',
    mode    => '0744',
    content => 'I love Puppet'
}
