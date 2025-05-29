class Payment:
    def __init__(self, pmethod):
        self.method = pmethod

    def pay(self, amount):
        print(f'{self.method}로 {amount}원 결제 완료!!')