$(document).ready(function(){
    var NewsPaper=new function(){
        var that=this;
        this.posts=new function(){
            this.PostIndex=new function(){
                this.CategoryWisePostShow=new function(){
                    $('#category_id_select_post_page').click(function(){
                        var category_id=$(this).val();

                        if(category_id!=''){
                              window.location='/categories/'+category_id
                         }
                    });
                    $('.jkljkljlkljlk').click(function(){
//                        console.log(3444444444444)
                    })
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
    };
})
