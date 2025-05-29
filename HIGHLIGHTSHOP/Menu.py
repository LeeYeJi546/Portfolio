class Menu:
    # 상품 목록을 저장할 딕셔너리, 키는 상품 code
    menu_list = {}

    def getMenuList(self): 
        return Menu.menu_list
    
    def __init__(self, code, name, price):
        self.code = code
        self.name = name
        self.price = price
        Menu.menu_list[code] = self

    @staticmethod
    def load_menu():
        Menu('1', 'OFFICIAL LIGHT STICK ver.2', 42000)
        Menu('2', 'BALL CAP', 39000)
        Menu('3', 'T-SHIRT-BLACK', 42000)
        Menu('4', 'COLLECT BOOK', 28000)
        Menu('5', 'SNOWBALL KEY RING', 25000)
        Menu('6', 'PHONE TAB', 20000)
        Menu('7', 'METAL BADGE', 14000)
        Menu('8', 'GALSS & ACRYLIC COASTER SET', 35000)
        Menu('9', 'LABEL KEY RING', 24000)
        Menu('10', 'SMART TOK', 15000)