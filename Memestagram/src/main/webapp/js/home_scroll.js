$(document).ready(function () {
    var win = $(window);
    var bodyOffset = $('body').offset();
    // Each time the user scrolls
    win.scroll(function () {
        // End of the document reached?
        // console.log($(document).height(), win.height(), win.scrollTop());
        if ($(document).height() - win.height() == win.scrollTop()) {
            $('#loading').show();
            $('#posts').append(getPost());
            $('#loading').hide();
        }

        if ($(document).scrollTop() > bodyOffset.top) {
            $('#video').addClass('scroll');
            $('.scroll').get(0).play();
        } else {
            $('.scroll').get(0).pause();
            $('#video').removeClass('scroll');
        }
    });
});

// DB에서 데이터를 받아서 새로운 글을 만들어 주는 부분
var count = 1;

function getPost() {
	
	//DB 접속해서 새로운 글 select
	

    if(count > 7){
        count = 1;
    }
    var content = `<div class="post">
            <div class="header">
                <div class="profile_icon">
                    <img src="./image/user.png" alt="">
                </div>
                <div class="id">사용자 아이디 ${count}</div>
                <div class="menu">
                    <i class='bx bx-dots-horizontal-rounded'></i>
                </div>
            </div>
            <div class="content">
                <video id="video" src="./video/${count++}.mp4" controls autoplay muted playsinline></video>
            </div>
            <div class="buttons">
                <div class="button">
                    <i class="bx bx-heart icon"></i>
                </div>
                <div class="button">
                    <i class="bx bx-comment icon"></i>
                </div>
                <div class="button">
                    <i class="bx bx-navigation icon"></i>
                </div>
            </div>
            <div class="like">
                <span>좋아요</span>
                <span class="like_count">7.7만</span>
                <span>개</span>
            </div>
            <div class="comments">
                <span><b>작성자</b></span>
                <span> </span>
                <span>댓글 내용입니다.</span> <br>
                <span class="show_more">더 보기</span>
            </div>
            <div class="comments_show">
                <span class="show_all">댓글 1234개 모두 보기</span>
            </div>
            <div class="comments_input">
                <input type="text" placeholder="댓글 달기...">
            </div>
            <hr>
        </div>`;

    return content;
}
