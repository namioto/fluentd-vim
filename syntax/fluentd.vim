" Vim syntax file
" Language: Fluentd 1.0
" Maintainer: Daesung Park
" Latest Revision: May 2020

if exists("b:current_syntax")
  finish
endif

syn case ignore

syn keyword FluentdDirectiveKeyword source filter match label contained nextgroup=FluentdDirectiveCondition skipwhite

syn match FluentdDirectiveBegin +[^<>]\++ contained
syn match FluentdDirectiveEnd +[^<>]\++ contained

syn match FluentdComment +#.*+
syn match FluentdString +"[^"]*"+

syn match FluentdDirectiveLabel +@[^>]*+ contained
syn region FluentdPluginBegin matchgroup=fluentdDelimiterBegin start=+<+ end=+>$+ contains=FluentdDirectiveKeyword,FluentdDirectiveLabel,FluentdDirectiveBegin,FluentdStructure
syn region FluentdPluginEnd matchgroup=fluentdDelimiterEnd start=+</+ end=+>$+ contains=FluentdDirectiveKeyword,FluentdDirectiveEnd,FluentdStructure

syn match FluentdTag +^\s\+@\S*+
syn match FluentdUserTag +@[^>]*+

syn match FluentdNumber +\s\d\+[\s\n]+
syn match FluentdDecimal +\s\d\+\.\d\++
syn match FluentdIp +\s\+\d\{1,3}\(\.\d\{1,3}\)\{3}\(:\d\{1,5}\|/\d\{1,2}\)\?+

syn match FluentdEnvironment +[#\$]{.*}+
syn match FluentdRubyEnvironment +<%=.*%>+

syn match FluentdInclude +@include[^>]*+
syn keyword FluentdBoolean true false
syn match FluentdUnderline +http[^>]*+

syn keyword FluentdStructure server record regexp store buffer secondary parse contained nextgroup=FluentdDirectiveCondition skipwhite
syn keyword FluentdInputPluginType tail forward udp tcp unix http syslog exec dummy monitor_agent windows_eventlog
syn keyword FluentdOutputPluginType file forward http exec exec_filter secondary_file copy relabel roundrobin stdout null s3 kafka elasticsearch mongo mongo_replset rewrite_tag_filter webhdfs
syn keyword FluentdFilterPluginType record_transformer

syn keyword FluentdParameter host port apikey auto_create_table path tag enable_ruby pos_file path_timezone exclude_path refresh_interval limit_recently_modified skip_refresh_on_startup read_from_head encoding read_lines_limit multiline_flush_interval pos_file_compaction_interval path_key rotate_wait enable_watch_timer enable_stat_watcher open_on_every_update emit_unmatched_lines ignore_repeated_permission_error


hi link FluentdInclude            Include
hi link FluentdUnderline          Underlined

hi link FluentdInputPluginType    Type
hi link FluentdOutputPluginType   Type
hi link FluentdFilterPluginType   Type

hi link FluentdParameter          Tag
hi link FluentdStructure          Structure

hi link FluentdDirectiveKeyword   Label
hi link FluentdDelimiterBegin     Function
hi link FluentdDelimiterEnd       Identifier
hi link FluentdDirectiveLabel     Function
hi link FluentdComment            Comment

hi link FluentdTag                Identifier
hi link FluentdUserTag            Function
hi link FluentdString             String
hi link FluentdNumber             Number
hi link FluentdDecimal            Number
hi link FluentdBoolean            Boolean
hi link FluentdIp                 Number
hi link FluentdDirectiveBegin     Function
hi link FluentdDirectiveEnd       Identifier
hi link FluentdEnvironment        Macro
hi link FluentdRubyEnvironment    Macro
