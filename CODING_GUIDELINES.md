* Prefer concise and clear code over performance
* Optimize for smaller files to make it easier to keep mental models.
* It's okay to not be so DRY if it means the code is more readable
* Follow lazy.nvim best practices:
  - Plugin should work without requiring setup() call
  - Use opts instead of config when possible
  - Only use dependencies if they must be loaded immediately
* Always do a basic validity check on all function input
