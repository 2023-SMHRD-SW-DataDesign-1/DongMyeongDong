document.addEventListener('DOMContentLoaded', function () {
    const postList = document.getElementById('posts');
    const detailView = document.getElementById('balance_post_modal');

    // 버튼 이벤트 위임
    postList.addEventListener('click', function (event) {
        if (event.target.classList.contains('bx-comment')) {
            const postId = event.target.dataset.postId;
            console.log(postId);
            showDetailView(postId);
            detailView.style.display = "block";
            document.body.classList.add('modal-open');

            // 모달 바깥 영역을 클릭하면 모달이 닫히도록 이벤트 리스너 추가
            window.onclick = function (event) {
                if (event.target === detailView) {
                    closeDetailView();
                    document.body.classList.remove('modal-open');
                }
            };
        }
    });

    // 상세화면을 보여주는 함수
    function showDetailView(postId) {
        // 상세화면 표시
        detailView.innerHTML = `
        <div class="post_modal-content">
        <div class="show_post">
            <div class="sp_content">
                <div class="sp_file">
                    <img src="./image/astronaut-8061095_1280.png" alt="">
                </div>
                <div class="sp_detail">
                    <div class="sp_detail_user">
                        <div><img src="./image/user.png" alt=""></div>
                        <div>user_name</div>
                    </div>
                    <div class="sp_comment_area">
                        <div class="sp_comment">
                            <div><img src="./image/user.png" alt=""></div>
                            <div><b>user_name1</b><span>게시글 내용이 엄청 길어지면 어떻게 되지 2줄로 내려가서 공간을 차지하나 아니면 한줄로 쭉 작성되나?</span></div>
                        </div>
                        <div class="sp_comment">
                            <div><img src="./image/user.png" alt=""></div>
                            <div><b>user_name2</b><span>댓글 내용입니다.</span></div>
                        </div>
                        <div class="sp_comment">
                            <div><img src="./image/user.png" alt=""></div>
                            <div><b>user_name3</b><span>댓글 내용입니다.</span></div>
                        </div>
                    </div>
                    <div class="sp_button_area">
                        <div class="button">
                            <i class="bx bx-heart icon"></i>
                        </div>
                        <div>좋아요 88.5만개</div>
                    </div>
                    <div class="sp_comment_input_area">
                        <input type="text" placeholder="댓글 달기...">
                        <button id="sp_comments_btn">게시</button>
                    </div>
                </div>
            </div>
        </div>
    </div>`;
    }

    // 상세화면 닫기 함수
    function closeDetailView() {
        detailView.innerHTML = ''; // 상세화면 비움
        detailView.style.display = 'none';
    }
});