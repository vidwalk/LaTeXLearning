def UtopianCoins(N):
    if N<7:
        return N
    if(N-22 > 0):
        return 1 + UtopianCoins(N-22)
    if(N-10 > 0):
        return 1 + UtopianCoins(N-10)
    if(N-7 > 0):
        return 1 + UtopianCoins(N-7)

if __name__ == "__main__":
    print("nr of coins to pay 159[22*7+5]: ", UtopianCoins(159))
    