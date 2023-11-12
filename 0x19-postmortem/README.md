## Postmortem

### Issue Summary
On a day that will forever live, **Friday**, **March 24, 2017**, our website decided to take an unscheduled vacation. From **07:32:16 GMT** to **07:11:52 GMT**, users were greeted with a 500 Internal Server Error. The culprit? A rogue .phpp file extension hiding in our WordPress settings file. Sneaky, right?

### Timeline
- **07:32:16 GMT**: The issue was first detected when a `curl` command returned a 500 Internal Server Error.
- **07:32:17 GMT**: The issue was detected through an internal check of the server status.
- **07:32:18 GMT**: Initial assumption was a server configuration error or a problem with the WordPress installation.
- **07:32:20 GMT**: Investigation began into the server and WordPress configuration files.
- **07:32:30 GMT**: The issue was escalated to the site reliability team.
- **07:32:40 GMT**: A misleading investigation path was taken when checking for server memory issues.
- **07:33:00 GMT**: The root cause was identified using `strace`, `tmux`, and `grep` to find a file extension written as `.phpp` instead of `.php` in `/var/www/html/wp-settings.php`.
- **07:11:52 GMT**: The issue was resolved by applying a Puppet script to replace all `.phpp` with `.php` in the affected file. And just like that, balance is restored to the universe.

### Root Cause and Resolution
The root cause of the issue was a typographical error in the `/var/www/html/wp-settings.php` file where a file extension was incorrectly written as `.phpp` instead of `.php`. This caused the server to return a 500 Internal Server Error as it could not process the file correctly. The issue was resolved by using a Puppet script to find and replace all instances of `.phpp` with `.php` in the affected file.

### Corrective and Preventative Measures
To prevent this issue from recurring, we can improve our code review and testing processes to catch such typographical errors before deployment. Specific tasks to address the issue include:
- Implement a code linter to catch typographical errors in file extensions.
- Add more comprehensive tests for our deployment pipeline to catch errors before they reach production.
- Train the team on using debugging tools like `strace`, `tmux`, and `grep` for efficient problem-solving.

And remember, always double-check your file extensions! It's `.php`, not `.phpp`! 😉
