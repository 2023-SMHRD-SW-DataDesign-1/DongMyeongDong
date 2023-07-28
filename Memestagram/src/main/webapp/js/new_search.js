/**
 * 
 */
document.addEventListener('DOMContentLoaded', function() {
	const sidebar = document.getElementById('sidebar');
	const box = document.getElementById('box');
	const htmlElement = document.documentElement;

	// 버튼 이벤트 위임
	sidebar.addEventListener('click', function(event) {
		if (event.target.classList.contains('search')) {
			
			sidebar.style.width = "470px";
			showSearchBar();
			showSessionArray();

			// 검색창 바깥 영역을 클릭하면 이전 사이드바로 변경
			window.onclick = function(event) {
				
				console.log(event.target);
				
				if (event.target === box || event.target === htmlElement) {
					sidebar.style.width = "340px";
					showSideBar();
				}
			};
		}
	});

	// 검색창 보여주기
	function showSearchBar() {
		sidebar.innerHTML = `<div class="sb_logo">
    <span class="sb_logo-name">Memestagram</span>
</div>
<div class="sb_sidebar-content">
    <div class="sb_sidebar_menu">
        <ul class="sb_lists">
            <li class="sb_list">
                <a href="New_home.jsp" class="nav-link">
                    <i class='bx bx-home icon'></i>
                </a>
            </li>
            <li class="sb_list">
                <a class="nav-link search">
                    <i class="bx bx-search icon"></i>
                </a>
            </li>
            <li class="sb_list">
                <a href="New_Balance.jsp" class="nav-link">
                    <i class='bx bx-joystick-alt icon'></i>
                </a>
            </li>
            <li class="sb_list">
                <a href="New_shop.jsp" class="nav-link">
                    <i class="bx bx-cart-alt icon"></i>
                </a>
            </li>
            <li class="sb_list">
                <a class="nav-link create_post">
                    <i class="bx bx-plus-circle icon"></i>
                </a>
            </li>
            <li class="sb_list">
                <a href="New_profile.jsp" class="nav-link">
                    <i class="bx bx-user-circle icon"></i>
                </a>
            </li>
        </ul>

        <div class="bottom-cotent">
            <li class="sb_list">
                <a href="#" class="nav-link">
                    <i class="bx bx-cog icon"></i>
                </a>
            </li>
            <li class="sb_list">
                <a href="#" class="nav-link">
                    <i class="bx bx-log-out icon"></i>
                </a>
            </li>
        </div>
    </div>

    <div class="search_bar">
        <h2>검색</h2>
        <input type="text" placeholder="검색" id="userInput" onkeydown="handleEnter(event)">
        <div>
            <h4>최근 검색 항목</h4><button class="delete_all" onclick="handleRemoveAll()">모두 지우기</button>
        </div>
        <div class="search_log" id="search_log">
			
        </div>
    </div>
</div>`;
	}

	// 사이드바 보여주기
	function showSideBar() {
		sidebar.innerHTML = `<div class="logo">
    <span class="logo-name">Memestagram</span>
</div>
<div class="sidebar-content">
    <ul class="lists">
                <li class="list">
                    <a href="New_home.jsp" class="nav-link">
                        <i class='bx bx-home icon'></i>
                        <span class="link">홈</span>
                    </a>
                </li>
                <li class="list">
                    <a class="nav-link search">
                        <i class="bx bx-search icon"></i>
                        <span class="link">검색</span>
                    </a>
                </li>
                <li class="list">
                    <a href="New_Balance.jsp" class="nav-link">
                        <i class='bx bx-joystick-alt icon'></i>
                        <span class="link">밸런스게임</span>
                    </a>
                </li>
                <li class="list">
                    <a href="New_shop.jsp" class="nav-link">
                        <i class="bx bx-cart-alt icon"></i>
                        <span class="link">리워드상점</span>
                    </a>
                </li>
                <li class="list">
                    <a class="nav-link create_post">
                        <i class="bx bx-plus-circle icon"></i>
                        <span class="link">만들기</span>
                    </a>
                </li>
                <li class="list">
                    <a href="New_profile.jsp" class="nav-link">
                        <i class="bx bx-user-circle icon"></i>
                        <span class="link">프로필</span>
                    </a>
                </li>
            </ul>

    <div class="bottom-cotent">
        <li class="list">
            <a href="#" class="nav-link">
                <i class="bx bx-cog icon"></i>
                <span class="link">설정</span>
            </a>
        </li>
        <li class="list">
            <a href="#" class="nav-link">
                <i class="bx bx-log-out icon"></i>
                <span class="link">로그아웃</span>
            </a>
        </li>
    </div>
</div>`;
	}
});

// 검색창에 엔터 입력
function handleEnter(event) {
	if (event.key === "Enter") {
		window.location.href = "New_search.jsp"
		event.preventDefault(); // 기본 엔터 행동 방지 (폼 전송 방지)
		const userInput = document.getElementById("userInput").value;
		processInput(userInput); // 입력값을 처리하는 함수 호출
		document.getElementById("userInput").value = "";
	}
}

function processInput(input) {
	// 여기에서 입력값을 원하는대로 처리합니다.
	// 이 예시에서는 입력값을 그대로 결과 영역에 출력하는 것으로 합니다.
	addToSessionArray(input);
	
	showSessionArray();
}

function showSessionArray(){
	
	const sessionData = getSessionArray();
	
	const search_log = document.getElementById("search_log");
	
	search_log.innerHTML = "";
	
	for(var i=0; i<sessionData.length; i++){
		search_log.innerHTML += `<div><span>${sessionData[i]}</span><button>X</button></div>`;
	}
}

// 모두 지우기 버튼 클릭
function handleRemoveAll() {
	
	deleteToSessionArray();
	
	const search_log = document.getElementById("search_log");
	
	search_log.innerHTML = "";
}

// 세션 스토리지에서 배열을 가져오는 함수
function getSessionArray() {
	const sessionData = sessionStorage.getItem('mySessionArray');
		
	return sessionData ? JSON.parse(sessionData) : [];
}

// 배열에 데이터를 추가하는 함수
function addToSessionArray(input) {
	const sessionArray = getSessionArray();
	
	if(sessionArray.length > 15){
		sessionArray.shift();
	}
	
	sessionArray.push(input);

	// 세션 스토리지에 배열 데이터를 저장
	sessionStorage.setItem('mySessionArray', JSON.stringify(sessionArray));
}

// 배열에 데이터를 제거하는 함수
function deleteToSessionArray() {
	const sessionArray = getSessionArray();
	sessionArray.splice(0, sessionArray.length);

	// 세션 스토리지에 배열 데이터를 저장
	sessionStorage.setItem('mySessionArray', JSON.stringify(sessionArray));
}