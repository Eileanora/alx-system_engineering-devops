# config file to set up client SSH configuration so that we can connect without typing a password
file { '~/.ssh/config':
    ensure  => 'file',
    owner   => 'ubuntu',
    group   => 'ubuntu',
    mode    => '0600',
    content => "
    IdentityFile ~/.ssh/school
    PasswordAuthentication no
    ",
}
