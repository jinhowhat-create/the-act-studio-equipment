# The act Studio Equipment Board — 배포 패키지

The act Studio 전용 장비 체크 보드입니다. OBF 촬영 대시보드와 분리된 독립 프로젝트로 구성합니다.

## 기능
- 카메라, 렌즈, 미디어·모니터, 조명, 그립, 음향, 무전기, 전원, 케이블, 백업 등 기본 장비 목록
- 초록/노랑/빨강 상태 표시
- 챙김/미챙김 및 필요/챙김 수량
- 담당자와 메모 편집
- 전체 준비율, 확인 필요 개수, 검색/분류 필터
- CSV 내보내기
- Supabase Realtime 동기화
- 공개 조회 + 관리자 이메일 로그인 및 관리자 전용 목록 편집

## 먼저 알아둘 점
이 패키지는 파일 제작본이며, GitHub/Vercel에 배포된 것은 아닙니다. The act Studio 전용 Supabase 프로젝트를 연결하기 전까지는 데모 미리보기로 실행됩니다. 기존 OBF 데이터베이스에 연결하지 않도록 Supabase URL과 publishable key는 비워 두었습니다.

## 배포 순서
1. The act Studio 용도의 별도 Supabase 프로젝트를 생성하거나 스튜디오에서 지정한 프로젝트를 사용합니다.
2. Supabase SQL Editor에서 `supabase_setup.sql`을 실행합니다. 실행 전에 SQL 안의 `jinhowhat@gmail.com`을 실제 관리자 이메일로 변경하세요.
3. `index.html`에서 `ADMIN_EMAIL` 값도 동일한 관리자 이메일로 바꿉니다.
4. `index.html`의 `SUPABASE_URL`과 `SUPABASE_ANON_KEY`를 The act Studio 프로젝트 URL과 publishable key로 바꿉니다.
5. Supabase Authentication > URL Configuration에서 배포 도메인을 Site URL / Redirect URLs에 추가합니다.
6. `index.html`을 별도 GitHub 저장소에 업로드하거나, 기존 저장소와 별도 Vercel 프로젝트로 배포합니다.
7. 배포 URL에서 로그인, 추가/수정, 실시간 동기화를 테스트합니다.

## 권한 관련
현재 구조는 누구나 장비 목록을 볼 수 있고, 관리자 이메일로 로그인한 사용자만 장비 목록을 추가·편집하도록 설계했습니다. 다만 이 첫 버전에서는 팀원이 로그인 없이 상태/패킹 여부를 직접 수정할 수 없습니다. 여러 팀원이 체크해야 한다면, 팀원 인증을 추가하거나 체크 상태만 별도로 기록하는 권한 정책을 설계하는 것이 안전합니다.

## 테스트 체크리스트
- [ ] OBF 데이터베이스와 분리된 The act Studio 프로젝트에 연결
- [ ] 공개 링크에서 장비 목록 조회 가능
- [ ] 관리자 이메일로 로그인 링크 수신
- [ ] 관리자 계정으로 장비 추가/수정 가능
- [ ] 다른 기기에서 새로고침 없이 데이터 갱신되는지 확인
- [ ] 모바일 화면 확인


## 관리자 계정
- 허용된 관리자 이메일: `jinhowhat@gmail.com`
- Supabase SQL 정책과 `index.html`의 관리자 이메일을 동일하게 설정했습니다.
