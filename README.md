# Delphi Stock Search & Filter

A Delphi 7 application designed to simplify stock searching and filtering on data stored in Microsoft SQL Server(MSSQL). The application allows users to quickly locate products based on multiple criteria such as product name, barcode, brand, stock group, and status (active/inactive). It supports pagination and full-text search across multiple fields, with optional live update to the database when the "Edit Mode" checkbox is checked.

## Features
- Full-text search across multiple stock fields (name, model, brand, etc.)
- Filtering by product name, stock group, barcode, brand, and stock quantity
- Active/Inactive status filtering
- Pagination with configurable page size
- Grid auto-sizing for better readability
- "Edit Mode" checkbox enables DBGrid auto-update to the database
- Easy integration with ADO database connections

## Usage
1. Open the project in Delphi 7.
2. Set the database connection string in the `editConnection` field.
3. Use the filter fields and full-text search to narrow down stock items.
4. Navigate through pages using the page controls.
5. Select multiple items with the "Select All" checkbox.
6. Check the "Edit Mode" checkbox to enable live updates directly from the grid.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
