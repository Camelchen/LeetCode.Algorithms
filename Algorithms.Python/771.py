class Solution:
    def numJewelsInStones(self, J, S):
        result = 0
        stone = {}
        for s in S:
            if (s in stone):
                stone[s] += 1
            else:
                stone[s] = 1

        for j in J:
            if (j in stone):
                result += stone[j]
        return result


test = Solution()
print(test.numJewelsInStones("aA", "aAAbbbb"))
