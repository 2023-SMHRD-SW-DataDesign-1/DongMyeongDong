$(document).ready(function () {
    var win = $(window);
    var bodyOffset = $('body').offset();
    // Each time the user scrolls
    win.scroll(function () {
        // End of the document reached?
        // 밸런스 게임 글 애니메이션 처리
        const feedDiv = document.getElementById('posts');
        const posts = feedDiv.getElementsByClassName('balance_post');

        for (let post of posts) {
            const rect = post.getBoundingClientRect();

            // 화면 중앙으로 게시글이 오면 애니메이션 효과를 주기 위한 처리
            if (rect.top >= 0 && rect.bottom <= window.innerHeight) {
                if (!post.classList.contains('animated')) {
                    post.classList.add('animated');
                    balanceAnimation(post, 123456, 78910);
                }
            }
        }

        // 스크롤이 바닥에 닿으면 새로운 글 추가
        if ($(document).height() - win.height() == win.scrollTop()) {
            $('#loading').show();
            $('#posts').append(getBalancePost());
            $('#loading').hide();
        }
        
        // 비디오 자동재생
        var videoElement = $('.scroll').get(0);

        if ($(document).scrollTop() > bodyOffset.top) {
            if (videoElement) {
                $('#video').addClass('scroll');
                videoElement.play();
            } else {
                // 비디오 요소를 찾지 못한 경우에 대한 처리
            }
        } else {
            if (videoElement) {
                videoElement.pause();
                $('#video').removeClass('scroll');
            }
        }
    });
});

// DB에서 데이터를 받아서 새로운 글을 만들어 주는 부분
var count = 3;

function getPost() {

    if (count > 7) {
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
                <video id="video" src="./video/${count}.mp4" controls autoplay muted playsinline></video>
            </div>
            <div class="buttons">
                <div class="button">
                    <i class="bx bx-heart icon"></i>
                </div>
                <div class="button btn_show_comment" data-post-id="${count++}">
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
                <button id="comments_btn">게시</button>
            </div>
            <hr>
        </div>`;

    return content;
}

function getBalancePost() {

    var content = ` <div class="balance_post">
    <div class="header">
    <div class="balance_title"></div>
    <div class="balance_time">
        <i class='bx bx-time-five'></i>
        <span><b>12:30</b></span>
    </div>
    <div class="balance_reward">
        <i class='bx bx-coin'></i>
        <span><b>120P</b></span>
    </div>
    <div class="menu">
        <i class='bx bx-dots-horizontal-rounded'></i>
    </div>
    </div>
    <!-- 게시물 컨텐츠 영역 -->
    <div class="balance_content">
        <div class="balance_content_div">
            <img src="./image/balance_01.png" alt="">
        </div>
        <div class="balance_select_div">
            <div class="content_select_1">
                <div class="content_select_1_name">
                    <h3>월 200 백수</h3>
                </div>
                <div class="content_select_1_count">
                    <h4 class="count_num1">0</h4>
                </div>
            </div>
            <div class="content_select_2">
                <div class="content_select_2_name">
                    <h3>월 500 직장인</h3>
                </div>
                <div class="content_select_2_count">
                    <h4 class="count_num2">0</h4>
                </div>
            </div>
        </div>
    </div>
    <div class="buttons">
        <div class="button">
            <i class="bx bx-heart icon"></i>
        </div>
        <div class="button">
            <i class="bx bx-comment icon" data-post-id="${count++}"></i>
        </div>
        <div class="button">
            <i class="bx bx-navigation icon"></i>
        </div>
    </div>
    <div class="like">
        <span>좋아요</span>
        <span class="like_count">10.8만</span>
        <span>개</span>
    </div>
    <div class="comments">
        <span><b>작성자</b></span>
        <span> </span>
        <span>댓글 내용입니다.</span> <br>
        <span class="show_more">더 보기</span>
    </div>
    <div class="comments_show">
        <span class="show_all">댓글 1004개 모두 보기</span>
    </div>
    <div class="comments_input">
        <input type="text" placeholder="댓글 달기...">
        <button id="comments_btn">게시</button>
    </div>
    <hr>
</div>`;

    return content;
}


// 숫자 3자리마다 ',' 추가해주는 함수
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function balanceAnimation(post, num1, num2) {

    // var num1 = 123456;  // 선택지 1 값
    // var num2 = 78910;   // 선택지 2 값

    const count_num = post.getElementsByClassName("count_num1");
    const content_select_1 = post.getElementsByClassName("content_select_1");
    const count_num2 = post.getElementsByClassName("count_num2");
    const content_select_2 = post.getElementsByClassName("content_select_2");

    var select_1_ratio = Math.round((num1 / (num1 + num2)) * 100);
    var select_2_ratio = Math.round((num2 / (num1 + num2)) * 100);


    // 첫번째 선택지 숫자 증가 애니메이션
    $({ val: 0 }).animate({ val: num1 }, {
        duration: 1500,
        step: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num[0].textContent = num;
        },
        complete: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num[0].textContent = num;
        }
    });

    // 첫번째 선택지 비율 증감 애니메이션
    $({ val: 50 }).animate({ val: select_1_ratio }, {
        duration: 1500,
        step: function () {
            content_select_1[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_1[0].style.width = this.val + '%';
        }
    });

    // 두번째 선택지 숫자 증가 애니메이션
    $({ val: 0 }).animate({ val: num2 }, {
        duration: 1500,
        step: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num2[0].textContent = num;
        },
        complete: function () {
            var num = numberWithCommas(Math.floor(this.val));
            count_num2[0].textContent = num;
        }
    });

    // 두번째 선택지 비율 증감 애니메이션
    $({ val: 50 }).animate({ val: select_2_ratio }, {
        duration: 1500,
        step: function () {
            content_select_2[0].style.width = this.val + '%';
        },
        complete: function () {
            content_select_2[0].style.width = this.val + '%';
        }
    });
}
