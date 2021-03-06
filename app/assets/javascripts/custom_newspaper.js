$(document).ready(function(){
    var NewsPaper=new function(){
        var that=this;
        this.Posts=new function(){
            this.PostIndex=new function(){
                this.CategoryWisePostShow=new function(){
                    $('#category_id_select_post_page').click(function(){
                        var category_id=$(this).val();

                        if(category_id!=''){
                              window.location='/categories/'+category_id
                         }
                    });
                };
                this.PostSearch=new function(){
                    $('#central_post_search').keyup(function(){
                        var search_string=$(this).val();
                        if(search_string!=''){
                            $.ajax({
                                url:'/posts/post_search',
                                data: {search_string: search_string},
                                type: 'get'
                            });
                        }
                    })
                }
            };
        };
        this.Archive=new function(){
            this.PostSearchAccordingToDateAndCategory=new function(){
                $('.search_btn_for_archive_AT_date').click(function(){
                    var date=$('#archive_date_search').val();
                    var category=$('#category_id_select_archive_post').val();
                    $.ajax({
                        url:'/archives/previous_record',
                        data: {date: date,category:category},
                        type: 'get'
                    });
                });
                $('#category_id_select_archive_post').click(function(){
                    var date=$('#archive_date_search').val();
                    var category=$('#category_id_select_archive_post').val();
                    $.ajax({
                        url:'/archives/previous_record',
                        data: {date: date,category:category},
                        type: 'get'
                    });
                });
                $('#archive_date_search').change(function(){
                    var date=$('#archive_date_search').val();
                    var category=$('#category_id_select_archive_post').val();
                    $.ajax({
                        url:'/archives/previous_record',
                        data: {date: date,category:category},
                        type: 'get'
                    });
                });
            };
            this.ArchiveForUser=new function(){
                $('.search_btn_for_user_archive_AT_date').click(function(){
                    var date=$('#archive_user_date_search').val();
                    var category=$('#category_id_select_archive_news_user').val();
                    $.ajax({
                        url:'/news/previous_record',
                        data: {date: date,category:category},
                        type: 'get'
                    });
                });
                $('#category_id_select_archive_news_user').click(function(){
                    var date=$('#archive_user_date_search').val();
                    var category=$('#category_id_select_archive_news_user').val();
                    $.ajax({
                        url:'/news/previous_record',
                        data: {date: date,category:category},
                        type: 'get'
                    });
                });
                $('#archive_user_date_search').change(function(){
                    var date=$('#archive_user_date_search').val();
                    var category=$('#category_id_select_archive_news_user').val();
                    $.ajax({
                        url:'/news/previous_record',
                        data: {date: date,category:category},
                        type: 'get'
                    });
                });
            };
        };
        this.SetNewToHeadlines=new function(){
            $('#category_id_for_headline_add').click(function(){
                var date=$('#archive_date_for_headline_add').val();
                var category_id=$('#category_id_for_headline_add').val();
                $.ajax({
                    url:'/headlines/post_search_for_headline',
                    data: {date: date,category_id:category_id},
                    type: 'get'
                });
            });
            $('#archive_date_for_headline_add').change(function(){
                var date=$('#archive_date_for_headline_add').val();
                var category_id=$('#category_id_for_headline_add').val();
                $.ajax({
                    url:'/headlines/post_search_for_headline',
                    data: {date: date,category_id:category_id},
                    type: 'get'
                });
            });
        };

    };
})
