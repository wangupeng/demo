$('.date-picker-year').datepicker({
    autoclose: true,
    language: 'zh-CN',
    format: 'yyyy',
    startView: 0,
    maxViewMode: 2,
    minViewMode:2,
    forceParse: false
})
$('.date-picker-mon').datepicker({
    autoclose: true,
    language: 'zh-CN',
    format: 'yyyy-mm',
    startView: 0,
    maxViewMode: 2,
    minViewMode:1,
    forceParse: false
})
$('.date-picker').datepicker({
    autoclose: true,
    todayHighlight: true,
    language: 'zh-CN',
    format: 'yyyy-mm-dd',
    weekStart: 7,
    todayBtn: true//今日按钮
})
