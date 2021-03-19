using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Text.Json;

namespace AutoGit
{
    class Program
    {
        static void Main(string[] args)
        {
            foreach (string s in args)
            {
                switch (s)
                {
                    case "-rJSON":
                        AutoPull();
                        break;
                    case "-wJSON":
                        Console.WriteLine("TEMPLATE-STRING");
                        Console.WriteLine(TemplateJSON());
                        Console.WriteLine(" --- DONE --- ");
                        break;
                    default:
                        Console.WriteLine("Use '-wJSON' to get an example json-string");
                        Console.WriteLine("Use '-rJSON' to read the config.json");
                        Console.ReadLine();
                        break;
                }                   
            }
        }

        private static void AutoPull()
        {
            string STATEFUL_DIR = Directory.GetCurrentDirectory();
            Console.WriteLine(STATEFUL_DIR);
            Repos _repos = JsonSerializer.Deserialize<Repos>(File.ReadAllText(STATEFUL_DIR + "\\git.json"));

            foreach(GitRepository repo in _repos.Repositories)
            {
                Console.WriteLine("----------------------");
                Directory.SetCurrentDirectory(repo.Path);
                Console.WriteLine("Dir  - " + Directory.GetCurrentDirectory());
                Console.WriteLine("Git  - " + repo.RepositoryName);
                Console.WriteLine("Path - " +repo.Path);
                Console.WriteLine("");
                Process p = new Process()
                {
                    StartInfo = new ProcessStartInfo()
                    {
                        FileName = "git.exe",
                        Arguments = "pull",
                        RedirectStandardOutput = true
                    }
                };
                Console.WriteLine("Start Process:");
                Console.WriteLine(p.StartInfo.FileName + " " + p.StartInfo.Arguments);

                p.Start();

                Console.WriteLine(p.StandardOutput.ReadToEnd());

                p.WaitForExit();

                Console.WriteLine("");
                Console.WriteLine(" --- CLOSED --- ");
                Console.WriteLine("");
            }
        }

        private static string TemplateJSON()
        {
            Repos tempREPO = new Repos();

            tempREPO.Repositories.Add(
                new GitRepository
                {
                    RepositoryName = "[NAME-1]",
                    URL = "[URL]",
                    Branch = "[BRANCH]",
                    Path = "[DIRECTORY]"
                }
            );

            try 
            {
                return JsonSerializer.Serialize(tempREPO); 
            } 
            catch(Exception e) 
            {
                return e.Message; 
            }
        }
    }

    public class Repos
    {
        public List<GitRepository> Repositories { get; set; } = new List<GitRepository>();   
    }

    public class GitRepository
    {
        public string RepositoryName { get; set; } = "";
        public string URL { get; set; } = "";
        public string Branch { get; set; } = "";
        public string Path { get; set; } = "";
    }
}