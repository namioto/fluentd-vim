" Vim syntax file
" Language: Fluentd 1.0
" Maintainer: Daesung Park
" Latest Revision: May 2020

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Keyword Syntax
syn keyword FluentdDirectiveKeyword     contained source filter match label nextgroup=FluentdDirectiveCondition skipwhite
syn keyword FluentdSection              contained server record regexp store buffer secondary parse nextgroup=FluentdDirectiveCondition skipwhite

" Input Plugin Type
syn keyword FluentdInputPluginType      contained tail
syn keyword FluentdInputPluginType      contained forward
syn keyword FluentdInputPluginType      contained udp tcp
syn keyword FluentdInputPluginType      contained unix
syn keyword FluentdInputPluginType      contained http
syn keyword FluentdInputPluginType      contained syslog
syn keyword FluentdInputPluginType      contained exec
syn keyword FluentdInputPluginType      contained dummy
syn keyword FluentdInputPluginType      contained monitor_agent
syn keyword FluentdInputPluginType      contained windows_eventlog
" Output Plugin Type
syn keyword FluentdOutputPluginType     contained file forward http 
syn keyword FluentdOutputPluginType     contained exec exec_filter 
syn keyword FluentdOutputPluginType     contained secondary_file 
syn keyword FluentdOutputPluginType     contained copy relabel 
syn keyword FluentdOutputPluginType     contained roundrobin 
syn keyword FluentdOutputPluginType     contained stdout 
syn keyword FluentdOutputPluginType     contained null s3 
syn keyword FluentdOutputPluginType     contained kafka 
syn keyword FluentdOutputPluginType     contained elasticsearch 
syn keyword FluentdOutputPluginType     contained mongo mongo_replset 
syn keyword FluentdOutputPluginType     contained rewrite_tag_filter 
syn keyword FluentdOutputPluginType     contained webhdfs
" Filter Plugin Type
syn keyword FluentdFilterPluginType     contained record_transformer
syn keyword FluentdFilterPluginType     contained grep

"syn keyword FluentdParameter host port apikey auto_create_table path tag enable_ruby pos_file path_timezone exclude_path refresh_interval limit_recently_modified skip_refresh_on_startup read_from_head encoding read_lines_limit multiline_flush_interval pos_file_compaction_interval path_key rotate_wait enable_watch_timer enable_stat_watcher open_on_every_update emit_unmatched_lines ignore_repeated_permission_error

" Match Syntax
syn match   FluentdDirectiveBegin       contained +[^<>]\++
syn match   FluentdDirectiveEnd         contained +[^<>]\++
syn match   FluentdDirectiveLabel       contained +@[^>]*+

syn match   FluentdComment +#.*+
syn match   FluentdString +"[^"]*"+
syn match   FluentdNumber +\s\d\+[\s\n]+
syn match   FluentdDecimal +\s\d\+\.\d\++
syn match   FluentdIp +\s\+\d\{1,3}\(\.\d\{1,3}\)\{3}\(:\d\{1,5}\|/\d\{1,2}\)\?+
syn match   FluentdEnvironment +[#\$]{.*}+
syn match   FluentdRubyEnvironment +<%=.*%>+

syn match   FluentdInclude +@include[^>]*+
syn match   FluentdUnderline /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?\S*/

syn keyword FluentdBoolean true
syn keyword FluentdBoolean false

"syn match FluentdTag +^\s\+@\S*+
syn match FluentdPluginParameter +@type .*$+ contains=FluentdInputPluginType,FluentdOutputPluginType,FluentdFilterPluginType
syn match FluentdCommonParameter +@\(id\|log_level\|label\) .*$+
"syn match FluentdUserTag +@[^>]*+

syn region FluentdPluginBegin  matchgroup=fluentdDelimiterBegin start=+<+ end=+>$+ contains=FluentdDirectiveKeyword,FluentdDirectiveLabel,FluentdDirectiveBegin,FluentdSection

syn region FluentdPluginEnd matchgroup=fluentdDelimiterEnd start=+</+ end=+>$+ contains=FluentdDirectiveKeyword,FluentdDirectiveEnd,FluentdSection

hi link FluentdInclude            Include
hi link FluentdUnderline          Underlined
hi link FluentdPluginParameter    Include
hi link FluentdCommonParameter    Error

hi link FluentdInputPluginType    Type
hi link FluentdOutputPluginType   Type
hi link FluentdFilterPluginType   Type

hi link FluentdParameter          Tag
hi link FluentdSection            Structure
"hi link FluentdTag                Identifier
hi link FluentdTag                Include
hi link FluentdUserTag            Function
"hi link FluentdUserTag            Include

hi link FluentdDirectiveKeyword   Label
hi link FluentdDelimiterBegin     Function
hi link FluentdDelimiterEnd       Function
hi link FluentdDirectiveLabel     Function
hi link FluentdComment            Comment

hi link FluentdString             String
hi link FluentdNumber             Number
hi link FluentdDecimal            Number
hi link FluentdBoolean            Boolean
hi link FluentdIp                 Number
hi link FluentdDirectiveBegin     Function
hi link FluentdDirectiveEnd       Identifier
hi link FluentdEnvironment        Macro
hi link FluentdRubyEnvironment    Macro
