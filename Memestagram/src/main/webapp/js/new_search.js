/**
 * 
 */
document.addEventListener('DOMContentLoaded', function () {
    const sidebar = document.getElementById('sidebar');
    const box = document.getElementById('box');

    // 버튼 이벤트 위임
    sidebar.addEventListener('click', function (event) {
        if (event.target.classList.contains('search')) {

            sidebar.style.width = "470px";
            showSearchBar();

            // 검색창 바깥 영역을 클릭하면 이전 사이드바로 변경
            window.onclick = function (event) {
                if (event.target === box) {
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
        <input type="text" placeholder="검색">
        <div>
            <h4>최근 검색 항목</h4><button class="delete_all">모두 지우기</button>
        </div>
        <div class="search_log">
            <div><span>검색이력1</span><button>X</button></div>
            <div><span>검색이력2</span><button>X</button></div>
            <div><span>검색이력3</span><button>X</button></div>
            <div><span>검색이력4</span><button>X</button></div>
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