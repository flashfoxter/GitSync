import Foundation

class CompileCommitListTest {
    /**
     *
     */
    func refresh(){
        //sort repos by freshness: (makes the process of populating CommitsDB much faster)
        //we run the sorting algo on a bg thread as serial work (one by one)
        
        
        //get the 100 last commits from every repo:
            //we populate the CommitsDB on a bg thread
            //for each repo in sortedRepos (aka sorted by freshness)
                //get commit count
                //retrive only commits that are newer than the most distante time in the CommitsDB 
        
        //add new commits to CommitDB with a binarySearch
        
    }
}
