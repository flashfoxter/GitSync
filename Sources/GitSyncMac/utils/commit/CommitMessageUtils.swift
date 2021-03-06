import Foundation
@testable import Utils

class CommitMessageUtils{
	/**
	 * Returns a text "commit message title" derived from PARAM: status_list
	 * PARAM: status_list: a list with records that contain staus type, file name and state
	 * NOTE: C,I,R seems to never be triggered, COPIED,IGNORED,REMOVED,
	 * NOTE: In place of Renamed, Git first deletes the file then says its untracked
     */
    static func sequenceCommitMsgTitle(_ statusList:[[String:String]])->String{
		var numOfNewFiles:Int = 0
		var numOfModifiedFiles:Int = 0
		var numOfDeletedFiles:Int = 0
		var numOfRenamedFiles:Int = 0
		for statusItem in statusList{
			let cmd = statusItem["cmd"]!/*TODO: ⚠️️ rename to type or status_type*/
            switch GitCMD(rawValue:cmd){
				case .M?:numOfModifiedFiles += 1
                case .MM?:numOfModifiedFiles += 1/*new and experimental*/
                case .MD?:numOfDeletedFiles += 1/*new and experimental*/
				case .D?:numOfDeletedFiles += 1
				case .A?:numOfNewFiles += 1
                case .AA?:numOfNewFiles += 1
                case .AM?:numOfNewFiles += 1
                case .AD?:numOfNewFiles += 1
				case .R?: numOfRenamedFiles += 1/*This command seems to never be triggered in git*/
                case .RM?:numOfRenamedFiles += 1/*new and experimental*/
                case .RD?:numOfRenamedFiles += 1/*beta*/
				case .QQ?: numOfNewFiles += 1/*untracked files*/
				case .UU?: numOfModifiedFiles += 1/*unmerged files*/
                case .UA?: numOfNewFiles += 1/*unmerged files*/
                case .CM?: numOfModifiedFiles += 1/*beta*/
                case .C?: numOfModifiedFiles += 1/*beta*/
				default:
					fatalError("cmd: " + "\(cmd)" + " Not supported")
					break;
			}
		}
		var commitMessage:String = ""
		if numOfNewFiles > 0 {
			commitMessage +=  "New files added: " + "\(numOfNewFiles)"
		}
		if numOfModifiedFiles > 0 {
			if !commitMessage.isEmpty {  commitMessage +=  ", " }/*--append comma*/
			commitMessage +=  "Files modified: " + "\(numOfModifiedFiles)"
		}
		if numOfDeletedFiles > 0 {
			if !commitMessage.isEmpty {  commitMessage += ", " }/*--append comma*/
			commitMessage +=  "Files deleted: " + "\(numOfDeletedFiles)"
		}
		if numOfRenamedFiles > 0 {
			if !commitMessage.isEmpty {  commitMessage +=  ", "}/*--append comma*/
			commitMessage +=  "Files renamed: " + "\(numOfRenamedFiles)"
		}
		return commitMessage
	}
    /**
     * Auto commit msg
     */
    static func generateCommitMessage(_ localRepoPath:String) -> CommitMessage? {
//        Swift.print("generateCommitMessage.localRepoPath: " + "\(localRepoPath)")
        let statusList:[[String:String]] = StatusUtils.generateStatusList(localRepoPath)//get current status
//        Swift.print("statusList: " + "\(statusList.count)")
//        Swift.print("before")
        guard !statusList.isEmpty else {return nil}/*nothing to add or commit,break the flow since there is nothing to commit or process*/
        /*there is something to add or commit*/
//        Swift.print("before processStatusList")
        StatusUtils.processStatusList(localRepoPath, statusList)/*process current status by adding files, now the status has changed, some files may have disapared, some files now have status as renamed that prev was set for adding and del*/
//        Swift.print("before commitMessage.init")
        let retVal = CommitMessage.init(statusList:statusList)/*return true to indicate that the commit completed*/
//        Swift.print("retVal: " + "\(retVal)")
        return retVal
    }
}
