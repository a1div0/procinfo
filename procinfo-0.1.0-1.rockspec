package = 'procinfo'
version = '0.1.0-1'
source  = {
    url    = 'git+https://github.com/a1div0/procinfo.git';
    branch = 'main';
    tag = '0.1.0'
}
description = {
    summary  = "Utility for getting operating system information on the current process for Tarantool";
    homepage = 'https://github.com/a1div0/procinfo';
    maintainer = "Alexander Klenov <a.a.klenov@ya.ru>";
    license  = 'BSD2';
}
dependencies = {
    'lua >= 5.1';
}
build = {
    type = 'builtin';
    modules = {
        ['procinfo'] = 'procinfo/init.lua';
    }
}
