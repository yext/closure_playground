# Closure Template Builder

This project is meant to be used for writing simple closure templates, compiling them, and viewing them on your local machine.

## Requirements

* Java - JDK and JRE
* Python

## Quickstart

1. Open two terminals to the root directory of the repository
1. In one of the terminals, run `./compile.sh sample`
1. In the other terminal, run `./serve.sh sample`

## Create a New Project

1. Run `./create.sh [PROJECT_NAME]` using a project name with alphanumeric characters and underscores **only**
1. Open two terminals to the root directory of the repository
1. In one of the terminals, run `./compile.sh [PROJECT_NAME]`
1. In the other terminal, run `./serve.sh [PROJECT_NAME]`

## Structure

| Path | Notes |
|------|-------|
| bin/ | Binaries and dependencies for compiling closure to JS functions, and web page JS dependencies |
| templates/ | The root directory for the template projects are stored. |
| templates/[PROJECT_NAME] | A project directory. This contains .soy files and a data.json file. |
| out/ | The location where the compiled JS and HTML file are output. Not tracked by Git. |
| create.sh | The script file that creates a new template project. |
| compile.sh | The script file to run that monitors a particular project and recompiles when changes are made. |
| serve.sh | The script file to run to start a web server in the root directory. It also will attempt to open a browser to the URL for the compiled HTML file. |
