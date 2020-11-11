Tag.create([
  { name: '会社連絡' },
  { name: '顧客管理' },
  { name: '依頼手配'},
  { name: '議事録'},
  { name: '日報'},
  { name: 'その他'},
  ])
  
  User.create!(
    [
      {
        nickname: 'リンゴ',
        email: 'tappleao@sample.com',
        password: 'password1234',
        password_confirmation: 'password1234',
        first_name: '緑',
        family_name: '青山',
        first_name_kana: 'ミドリ',
        family_name_kana: 'アオヤマ',
        department_id: '2',
        birthday: '1980-11-19',
        prefecture_id: '28',
        hobby: '旅行・動物',
        free: '休みの日は、散歩や旅行に行きます！ チワワを飼っています！ 動物好きです！'
      },
      {
        nickname: 'チャピ',
        email: 'yume@sample.com',
        password: 'password1234',
        password_confirmation: 'password1234',
        first_name: '侑芽',
        family_name: '川上',
        first_name_kana: 'ユメ',
        family_name_kana: 'カワカミ',
        department_id: '2',
        birthday: '1995-08-09',
        prefecture_id: '27',
        hobby: '音楽・動物',
        free: 'セキセイインコ飼っています。'
      },
      {
        nickname: 'モリ',
        email: 'mori@sample.com',
        password: 'password1234',
        password_confirmation: 'password1234',
        first_name: '英二',
        family_name: '森川',
        first_name_kana: 'エイジ',
        family_name_kana: 'モリカワ',
        department_id: '2',
        birthday: '1986-07-14',
        prefecture_id: '27',
        hobby: '',
        free: ''
      },
      {
        nickname: 'あお',
        email: 'aoi@sample.com',
        password: 'password1234',
        password_confirmation: 'password1234',
        first_name: '美月',
        family_name: '蒼',
        first_name_kana: 'ミヅキ',
        family_name_kana: 'アオイ',
        department_id: '4',
        birthday: '1992-04-09',
        prefecture_id: '28',
        hobby: 'ショッピング',
        free: '休みの日はお店巡りをしています！最近はDIYにハマっています。'
      },
      {
        nickname: '谷けん',
        email: 'tani@sample.com',
        password: 'password1234',
        password_confirmation: 'password1234',
        first_name: '健',
        family_name: '谷澤',
        first_name_kana: 'タケル',
        family_name_kana: 'タニザワ',
        department_id: '6',
        birthday: '1990-08-19',
        prefecture_id: '28',
        hobby: 'イラストの上達に向けて日々特訓中',
        free: 'デザイン担当なので、デザイン案件は僕に相談してください！'
      },
      {
        nickname: 'てら',
        email: 'tera@sample.com',
        password: 'password1234',
        password_confirmation: 'password1234',
        first_name: '龍斗',
        family_name: '寺井',
        first_name_kana: 'リュウト',
        family_name_kana: 'テライ',
        department_id: '6',
        birthday: '1979-11-05',
        prefecture_id: '28',
        hobby: '',
        free: ''
      },
      {
        nickname: '濱ちゃん',
        email: 'hama@sample.com',
        password: 'password1234',
        password_confirmation: 'password1234',
        first_name: '悟',
        family_name: '濱田',
        first_name_kana: 'サトル',
        family_name_kana: 'ハマダ',
        department_id: '6',
        birthday: '1989-03-01',
        prefecture_id: '27',
        hobby: '料理・筋トレ',
        free: 'イタリア料理練習中'
      },
      {
        nickname: 'うっちー',
        email: 'uti@sample.com',
        password: 'password1234',
        password_confirmation: 'password1234',
        first_name: '恵',
        family_name: '内山',
        first_name_kana: 'メグミ',
        family_name_kana: 'ウチヤマ',
        department_id: '3',
        birthday: '1991-06-14',
        prefecture_id: '28',
        hobby: '',
        free: ''
      },
      {
        nickname: 'わか',
        email: 'waka@sample.com',
        password: 'password1234',
        password_confirmation: 'password1234',
        first_name: '駿',
        family_name: '若林',
        first_name_kana: 'シュン',
        family_name_kana: 'ワカバヤシ',
        department_id: '7',
        birthday: '1999-04-20',
        prefecture_id: '28',
        hobby: 'キャンプ',
        free: '内定者の若林です。よろしくお願いいたします。'
      }
    ]
  )