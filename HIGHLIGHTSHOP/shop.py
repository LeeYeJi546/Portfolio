# 필요 모듈 import
from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse, RedirectResponse, FileResponse, JSONResponse
from fastapi.templating import Jinja2Templates

from Cart import Cart
from Menu import Menu
from Payment import Payment

import json

# FastAPI 객체 생성
app = FastAPI()

# template 관련 설정
templates = Jinja2Templates(directory="templates")

# 0. 메뉴 로딩 및 카트 생성
Menu.load_menu()
cart = Cart()

# 1. 메인 화면
@app.get("/", response_class=HTMLResponse)
async def menu_list(request: Request):
    return templates.TemplateResponse("list.html", {"request": request, 'menus': Menu.menu_list, 'cart': cart})

# 2. 장바구니 추가
@app.get("/add/{item_id}")
async def add_item(item_id):
    cart.add(Menu.menu_list[item_id])
    return RedirectResponse(url="/")

# 3. 장바구니 삭제
@app.get("/del/{item_id}")
async def del_item(item_id):
    cart.remove(Menu.menu_list[item_id])
    return RedirectResponse(url="/")

# 4. 결제
@app.get("/checkout")
async def checkout():
    total = cart.total()
    pay_method = Payment('카드')
    pay_method.pay(total)
    cart.clear()
    return RedirectResponse(url="/")

# 5. 검색
@app.get("/search")
async def search_item():
        Menu.menu_list = {}
        Menu.load_menu()
        return RedirectResponse(url="/")

@app.get("/search/{name}")
async def search_item(name):
    menus = Menu.menu_list.copy()
    for o in menus:
        if menus[o].name.find(name) < 0:
            del Menu.menu_list[menus[o].code]
    
    return RedirectResponse(url="/")

@app.get("/img")
async def getImage(request: Request):
    params = request.query_params
    print(params)
    return FileResponse("./sources/" + params.get("src"))

@app.get("/api/getMenu")
async def getMenu(requset: Request):
    menus = Menu.menu_list.copy()
    for o in menus:
        menus[o] = json.dumps(menus[o].__dict__)
        menus[o] = json.loads(menus[o])
    return JSONResponse(menus)