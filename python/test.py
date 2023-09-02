
# 二分探索
def search(data, value):
    left = 0
    right = len(data) - 1
    while left <= right:
        mid = (left + right) // 2
        if data[mid] == value:
            return mid
        elif data[mid] < value:
            left = mid + 1
        else:
            right = mid - 1
    return -1

data = [10, 30, 40, 60, 80, 90, 110, 140, 170, 190, 210, 260]
print(search(data, 140))

