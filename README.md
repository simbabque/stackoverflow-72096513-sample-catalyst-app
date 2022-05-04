This is a sample application for my answer to [this Stack Overflow question](https://stackoverflow.com/q/72096513/1331451).

To use it, you first need to install its Perl dependencies. This can be done with [cpanm](https://metacpan.org/dist/App-cpanminus/view/bin/cpanm), or by looking at the cpanfile and installing manually. You also need sqlite3.

```bash
$ cpanm --installdeps .
```

Next you need to create the database.

```bash
$ sqlite3 myapp.db <db.sql
```

To start the application, run the following command in one terminal.

```bash
$ perl script/myapp_server.pl
...
HTTP::Server::PSGI: Accepting connections at http://0:3000/
```

In a different terminal, you can now curl the application.

```bash
$ curl -X POST localhost:3000/user
{"id":1,"number_of_writes":1}
```

There is also test script that will create multiple users and call write operations on them several times at `script/test.pl`.