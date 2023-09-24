# config file to set up client SSH configuration so that we can connect without typing a password
file { '~/.ssh/config':
    ensure  => 'file',
    path    => '/etc/ssh/ssh_config',
    content => "
    IdentityFile ~/.ssh/school
    PasswordAuthentication no",
}
