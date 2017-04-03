class pgsql (

  $version          = '9.2'
  $datadir          = '/opt/appfiles/pro_08616_rogerio'
  $database         = 'p_08616_rogerio'
  $databaseuser     = 'rogerio'
  $password         = 'rogerio'
  $address          = '0.0.0.0/0'
  $archive_dbfiles  = '/opt/appfiles/'
  $archive_postgres = '/opt/appfiles/postgres'
  $archive_version  = "/opt/appfiles/postgres/${version}/"
  $archive_path     = "/opt/appfiles/postgres/${version}/${database}_archive/"

){
         class { 'postgresql::globals':
                 version      => $version,
                 datadir      => $datadir,
                 needs_initdb => true,
         }->

         class { 'postgresql::server':
                 listen_addresses  => '*',
                 postgres_password => $password,
                 #needs_initdb     => true,
         }

         postgresql::server::db { $database :
                 user     => $databaseuser,
                 owner    => $databaseuser,
                 password => postgresql_password($databaseuser, $password),
                 dbname   => $database,
         }

         postgresql::server::database_grant { $database :
                 privilege => 'ALL',
                 db        => $database,
                 role      => $databaseuser,
         }

        postgresql::server::pg_hba_rule { 'permitir ao usuario 
${databaseuser} acessar o banco ${database}' :
                 auth_method => 'md5',
                 type        => 'host',
                 database    => $database,
                 user        => $databaseuser,
                 address     => $address,
         }

         postgresql_conf { 'archive_command' :
                 name   => 'archive_command',
                 value  => "gzip -c \"%p\" > ${archive_path}\"%f\".gz < 
/dev/null",
                 target => "${datadir}/postgresql.conf",
         }

         file { [$archive_dbfiles, $archive_postgres, $archive_version, 
$archive_path] :
                 ensure  => 'directory',
                 owner   => $database_user,
         }
}
