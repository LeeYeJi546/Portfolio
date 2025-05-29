class Cart:
    def __init__(self):
        self.items = []

    def add(self, item):
        self.items.append(item)

    def remove(self, item):
        self.items.remove(item)

    def total(self):
        return sum(item.price for item in self.items)
    
    def clear(self):
        self.items.clear()

    def __str__(self):
        return f"Cart: {self.items}"