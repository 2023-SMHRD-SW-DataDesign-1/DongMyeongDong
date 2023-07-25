$(document).ready(function() {
	var win = $(window);
	var bodyOffset = $('body').offset();
	var currentPage = 1;
	getPost(currentPage);

	// Each time the user scrolls
	win.scroll(function() {
		// End of the document reached?
		// console.log($(document).height(), win.height(), win.scrollTop());


		if ($(document).height() - win.height() == win.scrollTop()) {

			$('#loading').show();
			currentPage += 1;
			getPost(currentPage);
			//$('#posts').append(getPost(currentPage));// getpost메소드에 매개변수로 마지막 글의 seq를 넘겨줘야 됨
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
img = ["png", "PNG", "JPG", "jpg", "GIF", "gif", "TIFF", "tiff", "psd", "PSD", "AI", "ai", "SVG", "svg", "EPS", "eps", "JFIF", "jfif", "BPG", "bpg", "SVG", "svg", "CGM", "cgm", "BMP", "bmp", "Exif", "exif"];

function getExtension(filename) {

	var filelen = filename.length;
	var lastdot = filename.lastIndexOf('.');
	var fileExt = filename.substring(lastdot + 1, filelen).toLowerCase();

	return fileExt;
}

// 좋아요!!!! 업데이트





// DB에서 데이터를 받아서 새로운 글을 만들어 주는 부분
var count = 1;

function getPost(page) {
	var content = "";
	$.ajax({
		url: "BoardShowCon.do",
		type: "post",
		data: { "page": page },
		datatype: "json",
		success: function(data) {

			$.each(data, function(index, data) {
				content += `<div class="post">
            <div class="header">
                <div class="profile_icon">
                <p class="board_seq" data-no="${data.board_seq}">${data.board_seq}</p>   
                </div>
                <div class="id"> ${data.mem_id}</div>
                <div class="menu">
                    <i class='bx bx-dots-horizontal-rounded'></i>
                </div>
            </div>
            <div class="content">`;
				var fileExtension = getExtension(data.board_img);

				if (img.includes(fileExtension)) {
					content += '<img src="img/' + data.board_img + '">';
				} else {
					content += '<video id="video" src="img/' + data.board_img + '" controls autoplay muted playsinline></video>';
				}
				content += `</div>
            <div class="buttons">
                <div class="button">
                <a idx=${data.board_seq} href="javascript:void(0)" onclick="heartClick()">
                `;
				if (data.checklike == 'Y') {
					content += '<img src="./img/fullheart.png" height="25px" width ="27px" class="fullheart" idx="' + data.board_seq + '">';
				} else {
					content += '<img src="./img/emptyheart.png" height="25px" width ="25px" class="emptyheart" idx="' + data.board_seq + '">';
				}


				content += `</a></div>
                <div class="button">
                    <i class="bx bx-comment icon"></i>
                </div>
                <div class="button">
                    <i class="bx bx-navigation icon"></i>
                </div>
            </div>
            <div class="like">
                <span>좋아요</span>
                <span class="like_count${data.board_seq}">${data.board_likes}</span>
                <span>개</span>
            </div>
            <div class="comments">
                <span><b>${data.mem_id}</b></span>
                <span> </span>
                <span>${data.board_content}</span> <br>
                <span class="show_more">더 보기</span>
            </div>
            <div class="comments_show">
                <span class="show_all">댓글 ${data.board_cmt_cnt}개 모두 보기</span>
            </div>
            <div class="comments_input">
                <input type="text" placeholder="댓글 달기...">
            </div>
           
            <hr>
        </div>`;


			});
			$('#posts').append(content);


			/*$(".heart").click(function() {*/
			function heartClick(){
				let board_seq = $(this).children("img").attr('idx');

				if ($(this).children('img').attr('class') == "emptyheart") {
					console.log("빈하트 클릭" + board_seq);

					$.ajax({
						url: 'LikeSaveCon.do',
						type: 'post',
						data: {
							board_seq: board_seq,
						},
						success: function(data) {
							let heart = data;
							alert(data);
							$('.like_count' + board_seq).text(heart);

							console.log("좋아요 성공");
							
						},
						error: function() {
							alert('좋아요 실패');
						}
					});
										$(".emptyheart").attr("src", "./img/fullheart.png");
										$(".emptyheart").attr("class", "fullheart");
										console.log("꽉찬하트로 바껴라!");




					// 꽉찬 하트를 눌렀을 때
				} else if (($(this).children('img').attr('class') == "fullheart")) {
					let board_seq = $(this).children("img").attr('idx');
					console.log("꽉찬하트 클릭" + board_seq);

					$.ajax({
						url: 'LikeDeleteCon.do',
						type: 'post',
						data: {
							board_seq: board_seq,
						},
						success: function(data) {
							let heart = data;
							alert(data);
							$('.like_count' + board_seq).text(heart);


						},
						error: function() {
							alert('좋아요 해제 실패');
						}
					});
				console.log("빈하트로 바껴라!")
					$(".fullheart").attr("src", "./img/emptyheart.png");
					$(".fullheart").attr("class", "emptyheart");

				}



			};


		},
		// success 닫히는 곳
		fail: function() {
			alert("통신 실패");
		}
	});

}



