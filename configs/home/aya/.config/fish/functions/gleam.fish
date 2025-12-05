# gleam.fish (中文提示版)

# 禁用默认的文件和目录补全
complete -c gleam -f

# 主命令描述
complete -c gleam -d 'Gleam 命令通过子命令访问不同的功能'

# --------------------------
# 项目和依赖管理子命令
# --------------------------

# add
complete -c gleam -n '__fish_use_subcommand' -a add -d '添加新的项目依赖'
complete -c gleam -n '__fish_seen_subcommand_from add' -l dev -d '将包添加为仅限开发的依赖'

# remove
complete -c gleam -n '__fish_use_subcommand' -a remove -d '移除项目依赖'

# new
complete -c gleam -n '__fish_use_subcommand' -a new -d '创建一个新项目'
complete -c gleam -n '__fish_seen_subcommand_from new' -l name -r -d '项目名称'
complete -c gleam -n '__fish_seen_subcommand_from new' -l skip-git -d '跳过 git 初始化和相关文件创建'
complete -c gleam -n '__fish_seen_subcommand_from new' -l skip-github -d '跳过 .github/* 文件创建'
complete -c gleam -n '__fish_seen_subcommand_from new' -l template -r -d '要使用的模板 (默认: erlang) [可选值: erlang, javascript]' -x -a 'erlang javascript'

# update
complete -c gleam -n '__fish_use_subcommand' -a update -d '更新依赖包到最新版本'

# deps
complete -c gleam -n '__fish_use_subcommand' -a deps -d '处理依赖包'
complete -c gleam -n '__fish_seen_subcommand_from deps' -a download -d '下载所有依赖包'
complete -c gleam -n '__fish_seen_subcommand_from deps' -a list -d '列出所有依赖包'
complete -c gleam -n '__fish_seen_subcommand_from deps' -a update -d '更新依赖包到最新版本'

# --------------------------
# 代码构建和检查子命令
# --------------------------

# build
complete -c gleam -n '__fish_use_subcommand' -a build -d '构建项目'
complete -c gleam -n '__fish_seen_subcommand_from build' -s t -l target -r -d '要针对的平台'
complete -c gleam -n '__fish_seen_subcommand_from build' -l warnings-as-errors -d '将编译时警告视为错误'

# check
complete -c gleam -n '__fish_use_subcommand' -a check -d '类型检查项目'
complete -c gleam -n '__fish_seen_subcommand_from check' -s t -l target -r -d '要针对的平台'

# clean
complete -c gleam -n '__fish_use_subcommand' -a clean -d '清理构建产物'

# format
complete -c gleam -n '__fish_use_subcommand' -a format -d '格式化源代码'
complete -c gleam -n '__fish_seen_subcommand_from format' -l check -d '检查输入是否已格式化，但不修改它们'
complete -c gleam -n '__fish_seen_subcommand_from format' -l stdin -d '从标准输入 (STDIN) 读取源代码'

# fix
complete -c gleam -n '__fish_use_subcommand' -a fix -d '重写已弃用的 Gleam 代码'

# --------------------------
# 运行和测试子命令
# --------------------------

# run
complete -c gleam -n '__fish_use_subcommand' -a run -d '运行项目'
complete -c gleam -n '__fish_seen_subcommand_from run' -s m -l module -r -d '要运行的模块'
complete -c gleam -n '__fish_seen_subcommand_from run' -l runtime -r -d '运行时'
complete -c gleam -n '__fish_seen_subcommand_from run' -s t -l target -r -d '要针对的平台'

# dev
complete -c gleam -n '__fish_use_subcommand' -a dev -d '运行项目开发入口点'
complete -c gleam -n '__fish_seen_subcommand_from dev' -l runtime -r -d '运行时'
complete -c gleam -n '__fish_seen_subcommand_from dev' -s t -l target -r -d '要针对的平台'

# test
complete -c gleam -n '__fish_use_subcommand' -a test -d '运行项目测试'
complete -c gleam -n '__fish_seen_subcommand_from test' -l runtime -r -d '运行时'
complete -c gleam -n '__fish_seen_subcommand_from test' -s t -l target -r -d '要针对的平台'

# shell
complete -c gleam -n '__fish_use_subcommand' -a shell -d '启动 Erlang shell'

# --------------------------
# 文档和发布子命令
# --------------------------

# docs
complete -c gleam -n '__fish_use_subcommand' -a docs -d '渲染 HTML 文档'
complete -c gleam -n '__fish_seen_subcommand_from docs' -a build -d '在本地渲染 HTML 文档'
complete -c gleam -n '__fish_seen_subcommand_from docs' -a publish -d '发布 HTML 文档到 HexDocs (需要 HEXPM_USER/PASS)'
complete -c gleam -n '__fish_seen_subcommand_from docs' -a remove -d '从 HexDocs 移除 HTML 文档 (需要 HEXPM_USER/PASS)'
complete -c gleam -n '__fish_seen_subcommand_from docs; and __fish_seen_subcommand_from build' -l open -d '渲染后在浏览器中打开文档'
complete -c gleam -n '__fish_seen_subcommand_from docs; and __fish_seen_subcommand_from remove' -l package -r -d '包的名称'
complete -c gleam -n '__fish_seen_subcommand_from docs; and __fish_seen_subcommand_from remove' -l version -r -d '要移除的文档版本'

# publish
complete -c gleam -n '__fish_use_subcommand' -a publish -d '将项目发布到 Hex 包管理器 (需要 HEXPM_USER/PASS)'
complete -c gleam -n '__fish_seen_subcommand_from publish' -l replace -d '替换现有包'
complete -c gleam -n '__fish_seen_subcommand_from publish' -s y -l yes -d '跳过确认'

# hex
complete -c gleam -n '__fish_use_subcommand' -a hex -d '处理 Hex 包管理器 (弃用/取消弃用需要 HEXPM_USER/PASS)'
complete -c gleam -n '__fish_seen_subcommand_from hex' -a retire -d '从 Hex 弃用版本'
complete -c gleam -n '__fish_seen_subcommand_from hex' -a unretire -d '从 Hex 取消弃用版本'

# --------------------------
# 导出子命令
# --------------------------

# export
complete -c gleam -n '__fish_use_subcommand' -a export -d '从 Gleam 项目导出有用的内容'
complete -c gleam -n '__fish_seen_subcommand_from export' -a erlang-shipment -d '预编译的 Erlang，适用于部署'
complete -c gleam -n '__fish_seen_subcommand_from export' -a hex-tarball -d '打包成 tarball 格式的包，适用于发布到 Hex'
complete -c gleam -n '__fish_seen_subcommand_from export' -a javascript-prelude -d 'JavaScript prelude 模块'
complete -c gleam -n '__fish_seen_subcommand_from export' -a typescript-prelude -d 'TypeScript prelude 模块'
complete -c gleam -n '__fish_seen_subcommand_from export' -a package-interface -d '项目中的模块、函数和类型信息 (JSON 格式)'
complete -c gleam -n '__fish_seen_subcommand_from export; and __fish_seen_subcommand_from package-interface' -l out -r -d 'JSON 文件的写入路径'

# --------------------------
# 其他子命令
# --------------------------

# lsp
complete -c gleam -n '__fish_use_subcommand' -a lsp -d '运行语言服务器 (供编辑器使用)'

# help
complete -c gleam -n '__fish_use_subcommand' -a help -d '打印此消息或给定子命令的帮助'