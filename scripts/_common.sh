#!/bin/bash

#=================================================
# COMMON VARIABLES
#=================================================

# dependencies used by the app
pkg_dependencies="\
        zlib1g-dev \
        libssl-dev \
        libjemalloc-dev \
        git \
        "

RUBY_VERSION="2.7.2"
NODEJS_VERSION="15.11.0"

SOURCE="https://github.com/standardnotes/web"
COMMIT="22da9ea942dbb9f7fe66af0bf43290b06b7fb482"

#=================================================
# PERSONAL HELPERS
#=================================================

# Execute a command as another user with login
# (hence in user home dir, with prior loading of .profile, etc.)
# usage: exec_login_as USER COMMAND [ARG ...]
exec_login_as() {
    local user=$1
    shift 1
    exec_as $user --login "$@"
}
# Execute a command as another user
# usage: exec_as USER COMMAND [ARG ...]
exec_as() {
    local user=$1
    shift 1

    if [[ $user = $(whoami) ]]; then
        eval "$@"
    else
        sudo -u "$user" "$@"
    fi
}

#================================================
# EXPERIMENTAL HELPERS
#=================================================

#=================================================
# FUTURE OFFICIAL HELPERS
#=================================================
