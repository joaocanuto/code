#include <bits/stdc++.h>
using namespace std;

class Solution {
public:
    long long beautifulSubarrays(vector<int>& nums) {
        map<int, int> seen;
        seen[0]++;
        long long ans = 0;
        int sum =0;
        for(int v : nums){
            sum ^= v;
            ans += seen[sum];
            seen[sum]++;
        }
        return ans;
    }
};
