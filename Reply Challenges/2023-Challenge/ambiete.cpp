#include <bits/stdc++.h>

using namespace std;

#define ll long long
//#define int long long
#define vi vector<int>
#define pii pair<int,int>
#define pb push_back
#define mp make_pair
#define fi first
#define se second
#define endl '\n'
#define mset(A,X) memset(A,X,sizeof A)
#define bug(x) cerr << #x << "  >>>>>>>  " << x << '\n'
#define _ << " , " <<

int matriz[4][4];
int dp[4][4];
int vis[4][4];
int maior = -1;

int move(int i, int j, int lenght)
{
    cout << "i: " << i << " j: " << j << " lenght: " << lenght << endl;
    if (i < 0)
    {
        i = 3;
    }
    else if (i > 3)
    {
        i = 0;
    }
    if (j < 0)
    {
        j = 3;
    }
    else if (j > 3)
    {
        j = 0;
    }
    if (lenght == 0)
    {
        return matriz[i][j];
    }
    if (vis[i][j] == 1)
    {
        return dp[i][j];
    }
    vis[i][j] = 1;
    int mm1 = max(move(i+1,j, lenght-1), move(i-1,j, lenght-1));
    int mm2 = max(move(i,j+1, lenght-1), move(i,j+1, lenght-1));
    dp[i][j] = max(mm1, mm2) + matriz[i][j];
    if(dp[i][j] > maior)
    {
        maior = dp[i][j];
    }
    cout << "dp[" << i << "][" << j << "] = " << dp[i][j] << endl;
}

// quero retornar a maior soma;

signed main(){
	ios_base::sync_with_stdio(false);cin.tie(NULL);
    int a,b,c; cin >> a >> b >> c;
    int l; cin >> l;
    int lenght = l;
    for(int i = 0; i < 4; i++)
    {
        for(int j = 0; j < 4; j++)
        {
            cin >> matriz[i][j];
        }
    }
    for(int i = 0; i < 4; i++)
    {
        for(int j = 0; j < 4; j++)
        {
            int mm1 = max(move(i+1,j, lenght), move(i-1,j, lenght));
            int mm2 = max(move(i,j+1, lenght), move(i,j+1, lenght));
            int soma = max(mm1, mm2);
        }
        cout << maior << endl;
    }
    for(int i = 0; i < 4; i++)
    {
        for(int j = 0; j < 4; j++)
        {
            cout << dp[i][j] << " ";
        }
        cout << endl;
    }

	return 0;
}
