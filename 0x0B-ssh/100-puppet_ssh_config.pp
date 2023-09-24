# config file to set up client SSH configuration so that we can connect without typing a password
file { '/home/ubuntu/.ssh/config':
    ensure  => 'file',
    owner   => 'ubuntu',
    group   => 'ubuntu',
    mode    => '0600',
    content => "
    Host *
        IdentityFile /home/ubuntu/.ssh/school
        PasswordAuthentication no
    ",
}
