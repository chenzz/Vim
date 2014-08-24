#include <iostream>
#include <algorithm>

using namespace std;

//Solution 1:
//和combinations那道很类似
//subsets = c(n, 0) + c(n, 1) + …… c(n, n)
class Solution
{
public:
	vector<vector<int>> subsets(vector<int> &S)
	{
		sort(S.begin(), S.end());

		for (int i = 0; i <= S.size(); i++)
			combinations(S, i, 0);

		return res;
	}

	void combinations(vector<int> &S, int k, int step)
	{
		if (k == 0)
			res.push_back(solution);
		else
		{
			for (int i = step; i <= S.size() - k; i++)
			{
				solution.push_back(S[i]);
				combinations(S, k-1, i+1);
				solution.pop_back();
			}
		}

		return;
	}

	vector<vector<int>> res;
	vector<int> solution;
};

//Solution 2
//这种方法跟Solution1类似，只不过换了个写法.
//http://fisherlei.blogspot.com/2013/01/leetcode-subsets.html
class Solution2
{
public:
	vector<vector<int>> subsets(vector<int> S)
	{
		sort(S.begin(), S.end());
		res.push_back(solution);
		generate(0, S);

		return res;
	}

	void generate(int step, vector<int> &S)
	{
		for (int i = step; i < S.size(); i++)
		{
			solution.push_back(S[i]);
			res.push_back(solution);
			if (i < S.size() - 1)
				generate(i+1, S);
			solution.pop_back();
		}
	}

	vector<vector<int>> res;
	vector<int> solution;
};

//Solution 3
//暂时没看懂。。
//http://blog.csdn.net/tuantuanls/article/details/8751495
class Solution3 
{
	vector<vector<int> > result;
public:
	void sub(vector<int> &S, vector<int> tmp, int level)
	{
		if(level == S.size())
		{
			result.push_back(tmp);
			return;
		}

		sub(S, tmp, level + 1);
		tmp.push_back(S[level]);
		sub(S, tmp, level + 1);

	}

	vector<vector<int> > subsets(vector<int> &S) 
	{
		vector<int> tmp;

		sort(S.begin(), S.end());
		sub(S, tmp, 0);

		return result;
	}

};

int main()
{
	vector<int> S = {7, 8, 9, 1};
	Solution2 s;

	cout << "Output:" << endl;
	for (auto &i : s.subsets(S))
	{
		for (auto &j : i)
			cout << j << " ";
		cout << endl;
	}

	return 0;
}
