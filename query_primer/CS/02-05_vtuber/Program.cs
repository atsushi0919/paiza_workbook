using System;
using System.Collections.Generic;
using System.Linq;

namespace _02_05_vtuber
{
    public struct Status
    {
        public bool Membership;
        public int SuperChat;
    }
    class Program
    {
        static void Main()
        {
            // 入力
            int n = int.Parse(Console.ReadLine());
            string[] requests = new string[n];
            for (int i = 0; i < n; i++)
            {
                requests[i] = Console.ReadLine();
            }

            // requests 処理
            var members = new Dictionary<string, Status>();
            foreach (var request in requests)
            {
                string[] requestParams = request.Split();
                string name = requestParams[0];
                string method = requestParams[1];

                bool membership = false;
                int superchat = 0;
                if (members.ContainsKey(name))
                {
                    membership = members[name].Membership;
                    superchat = members[name].SuperChat;
                }
                else
                {
                    members[name] = new Status();
                }
                switch (method)
                {
                    case "join":
                        membership = true;
                        break;
                    case "give":
                        int newSuperchat = int.Parse(requestParams[2]);
                        superchat += newSuperchat;
                        break;
                }
                members[name] = new Status()
                {
                    Membership = membership,
                    SuperChat = superchat
                };
            }

            // superchatMembers
            // SuperChat ありのメンバーを抽出
            // 金額降順 - 名前降順にソート
            var superchatMembers = members
                .Where(x => x.Value.SuperChat > 0)
                .OrderByDescending(x => x.Key)
                .OrderByDescending(x => x.Value.SuperChat);
            foreach (KeyValuePair<string, Status> member in superchatMembers)
            {
                Console.WriteLine(member.Key);
            }
            // membershipMembers
            // Membership のメンバーを抽出
            // 名前昇順にソート
            var membershipMembers = members
                .Where(x => x.Value.Membership)
                .OrderBy(x => x.Key);
            foreach (KeyValuePair<string, Status> member in membershipMembers)
            {
                Console.WriteLine(member.Key);
            }
        }
    }
}