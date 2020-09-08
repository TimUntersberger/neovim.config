S = irequire('lib.session')

S.enable_auto_save()

command {
    "SessionSave",
    [[lua S.save(<q-args>)]],
    nargs = 1
}

command {
    "SessionLoad",
    [[lua S.load(<q-args>)]],
    nargs = 1
}

command {
    "SessionDelete",
    [[lua S.delete(<q-args>)]],
    nargs = 1
}

command {
    "SessionClose",
    [[lua S.close()]]
}

command {
    "SessionCurrent",
    [[lua print(S.current_session())]]
}

command {
    "SessionList",
    [[lua print(vim.inspect(S.list()))]]
}
