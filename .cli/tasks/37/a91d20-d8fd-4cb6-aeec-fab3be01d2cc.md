# "init" command

## Description

Console application (cli) have to provide "init" command to be able to create dirs and files.

Syntax:

    cli init ROOT

On "init" cli have to do following:

- (✔) Create root dir: $ROOT/.cli
- (✔) Create subdirs:
`````````````````````````````````````````
        $ROOT/.fl/cards
        $ROOT/.fl/meta
        $ROOT/.fl/boards
        $ROOT/.fl/boards/backlog
        $ROOT/.fl/boards/progress
        $ROOT/.fl/boards/done
`````````````````````````````````````````
- (✔) Create config file with default values: $ROOT/.cli/config

## Acceptance criteria

* cli init ROOT works as described above.
* Unit tests for cli init command return successful result.

