# 작업관련 임시 문서


## Get Started

`bash scripts/docker-manager.sh -n opflow`

`bash scripts/docker-manager.sh -b django opflow`

`bash scripts/docker-manager.sh -u dev`


## Container environments

- OS: Ubuntu 20.04
- Python: 3.10
- Django: 4.04

## TODO

- [x] django docker 동작확인
- [ ] environments 관련 쉘스크립트 작성 (최종목표: 초기화 쉘) 및 gitignore update
- [ ] django 이해
    - [ ] Survey [BlogPost1](https://rakjido.github.io/2020/11/17/Django-Overview)
    - [ ] Survey [BlogPost2](https://velog.io/@kyeongraekim/Django-TIL)
- [ ] django logs 관련 작업
    - [ ] Survey [BlogPost1](https://king-minwook.tistory.com/81)
- [ ] django 최적 structure survey
    - [ ] [Djangobook](https://djangobook.com/django-tutorials/mastering-django-structure/)
    - [ ] [gitbooks](https://ohing.gitbooks.io/study/content/django/deploying_a_full_django_stack_with_docker-compose.html)
    - [ ] [wikidocs](https://wikidocs.net/72377)
- [ ] django locale 관리
    - [ ] Survey [webforefront](https://www.webforefront.com/django/i18ndefault.html)
- [ ] django secret 관리
    - [ ] Survey [BlogPost1](https://velog.io/@kyeongraekim/Django-TI (django-environ package)
- [ ] django test 관리
- [ ] docs 관리
    - [ ] Survey [Qiita](https://qiita.com/futakuchi0117/items/4d3997c1ca1323259844) (Sphinx)
- [ ] docstring 관리
    - [ ] Survey [BlogPost1](https://engineer-mole.tistory.com/136) (Google Docstring)
    - [ ] Survey [VScodeMarkey](https://marketplace.visualstudio.com/items?itemName=njpwerner.autodocstring) (docstring generator extension)
    - [ ] TODO: django에서 docstring & docs generator는 어떤식으로 사용하는지 조사 필요
- [ ] coding-style 관리 (linter-formatter CI level에서 action으로 지원하기)
    - [ ] Survey [DjangoDocs](https://docs.djangoproject.com/en/dev/internals/contributing/writing-code/coding-style/)
- [ ] Object Storage 필요성 파악 및 Apache Spark 도입 고려하기
- [x] Dockerfile 작성 최적화
- [ ] Redis 캐싱 적용 (Django 4.0)
- [ ] Monitoring 적용
- [ ] MQ가 필요한가?