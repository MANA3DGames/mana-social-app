import UIKit

class UsersVC: UITableViewController, UISearchBarDelegate
{
    @IBOutlet weak var searchBar: UISearchBar!
    
    let usersModel = UsersModel()

    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Search bar customization.
        searchBar.barTintColor = UIColor.white
        searchBar.tintColor = UIInfo.MCOLOR_BLACK
        searchBar.showsCancelButton = false
        
        usersModel.getRandomUsers( searchBar: searchBar, sender: self )
    }

    // Triggered when search bar text changed.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        usersModel.searchForUsers( searchBar: searchBar, keyword: searchText, sender: self )
    }
  
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        searchBar.showsCancelButton = true
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        // Reset UI.
        searchBar.endEditing( false )
        searchBar.showsCancelButton = false
        searchBar.text = ""
        
        // Clean saved date.
        usersModel.cleanUpSavedData( self )
    }

    // Returns cell count.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return usersModel.usersDic.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        return usersModel.createUserCell( tableView: tableView, cellForRowAt: indexPath )
    }

    // Proceeding segues that have been made in main.storyboard to another view.
    override func prepare( for segue: UIStoryboardSegue, sender: Any? )
    {
        usersModel.visitProfile( for: segue, sender: sender, usersView: self )
    }
}
