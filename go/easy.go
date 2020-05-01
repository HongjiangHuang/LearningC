package easy

// RemoveDuplicates ...
// 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。
// 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
func RemoveDuplicates(nums []int) int {
	i := 0
	for _, num := range nums {
		if i == 0 || num > nums[i-1] {
			nums[i] = num
			i++
		}
	}
	return i
}

/// MaxProfit 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。
/// 设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。
/// 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
/// 解题思路 找出所有升序数组
/// 7,1,5,3,6,4
func MaxProfit(prices []int) int {
	profit := 0
	for k := range prices {
		if k > 0 {
			diff := prices[k] - prices[k-1]
			if diff > 0 {
				profit = diff + profit
			}
		}
	}

	return profit
}
